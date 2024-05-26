using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Hausarbeit
{
    /// <summary>
    /// Interaktionslogik für SubWindow.xaml
    /// </summary>
    public partial class SubWindow : Window
    {
        private int _currentInhalt = 0, _currentQuestionPosition = 0;
        List<Aufgabenstellung> selectedAufgaben = new List<Aufgabenstellung>();
        List<Inhalt> selectedInhalt = new List<Inhalt>();
        List<Rueckmeldung> rueckmeldungen = new List<Rueckmeldung>();
        hausarbeit_DEEntities ctx;

        Window _mainWindow;

        public SubWindow(int selectedKapitel, Window mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;


            if (MyDataContext.mycultureinfo == "de-DE")
            {
                ctx = new hausarbeit_DEEntities();

                //var Task = Query();
                //Task.Wait();
                selectedInhalt = ctx.Inhalt.Where(x => x.Kapitel_id == selectedKapitel).ToList();
                // selectedInhalt= selectedInhalt.;
                List<int> k = new List<int>();

                selectedInhalt.ToList().ForEach(x => k.Add(x.Inhalt_id));



                selectedAufgaben = ctx.Aufgabenstellung.Where(x => x.Inhalt_id == selectedKapitel).ToList();

                rueckmeldungen = ctx.Rueckmeldung.ToList();


                Inhalt.Text = selectedInhalt.First().Inhalt_Text;
                Frage.Text = selectedAufgaben.First().AGS_Text;
            }
            else
            {

                hausarbeit_ENEntitie ctx = new hausarbeit_ENEntitie();
                this.DataContext = ctx.Kapitel.Local;

                selectedInhalt = ctx.Inhalt.Where(x => x.Kapitel_id == selectedKapitel).ToList();
                List<int> k = new List<int>();

                selectedInhalt.ToList().ForEach(x => k.Add(x.Inhalt_id));


                selectedAufgaben = ctx.Aufgabenstellung.Where(x => x.Inhalt_id == selectedKapitel).ToList();


                rueckmeldungen = ctx.Rueckmeldung.ToList();


                Inhalt.Text = selectedInhalt.First().Inhalt_Text;
                Frage.Text = selectedAufgaben.First().AGS_Text;
            }
            _mainWindow = mainWindow;
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            if (_currentInhalt > 0)
            {
                _currentInhalt--;
            }

            Inhalt.Text = selectedInhalt[_currentInhalt].Inhalt_Text;
        }

        private void Forth(object sender, RoutedEventArgs e)
        {
            if (_currentInhalt < selectedInhalt.Count() - 1)
            {
                _currentInhalt++;
            }

            Inhalt.Text = selectedInhalt[_currentInhalt].Inhalt_Text;
        }

        private void zuruck(object sender, RoutedEventArgs e)
        {
            _mainWindow.Show();
            this.Close();
        }

        private void NextQuestion(object sender, RoutedEventArgs e)
        {

            if (_currentQuestionPosition < selectedAufgaben.Count() - 1)
            {
                _currentQuestionPosition++;
            }
            else
            {
                _currentQuestionPosition = 0;
            }

            Frage.Text = selectedAufgaben.ElementAt(_currentQuestionPosition).AGS_Text;


        }
        private void QuestionHelp(object sender, RoutedEventArgs e)
        {

            List<int> AgsId = new List<int>();
            selectedAufgaben.ForEach(x => AgsId.Add(x.AGS_id));
            MessageBox.Show(rueckmeldungen.FirstOrDefault(x => x.AGS_id == selectedAufgaben[_currentQuestionPosition].AGS_id).Rueck_Text);
        }

        //public static async Task Query()
        //{
        //    selectedInhalt = await (from x in ctx.Inhalt select x).ToListAsync();
        //}
    }
}
