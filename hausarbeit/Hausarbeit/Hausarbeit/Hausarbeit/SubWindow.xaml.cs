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
        hausarbeit_DEContext ctx;

        Window _mainWindow;

        public SubWindow(int selectedKapitel, Window mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;


            if (MyDataContext.mycultureinfo == "de-DE")
            {
                ctx = new hausarbeit_DEContext();

                //var Task = Query();
                //Task.Wait();
                selectedInhalt = ctx.Inhalts.Where(x => x.KapitelId == selectedKapitel).ToList();
                // selectedInhalt= selectedInhalt.;
                List<int> k = new List<int>();

                selectedInhalt.ToList().ForEach(x => k.Add(x.InhaltId));



                selectedAufgaben = ctx.Aufgabenstellungs.Where(x => x.InhaltId == selectedKapitel).ToList();

                rueckmeldungen = ctx.Rueckmeldungs.ToList();


                Inhalt.Text = selectedInhalt.First().InhaltText;
                Frage.Text = selectedAufgaben.First().AgsText;
            }
            else
            {

               // hausarbeit_ENEntitie ctx = new hausarbeit_ENEntitie();
                //this.DataContext = ctx.Kapitel.Local;

                //selectedInhalt = ctx.Inhalts.Where(x => x.KapitelId == selectedKapitel).ToList();
                List<int> k = new List<int>();

                selectedInhalt.ToList().ForEach(x => k.Add(x.InhaltId));



                selectedAufgaben = ctx.Aufgabenstellungs.Where(x => x.InhaltId == selectedKapitel).ToList();

                rueckmeldungen = ctx.Rueckmeldungs.ToList();


                Inhalt.Text = selectedInhalt.First().InhaltText;
                Frage.Text = selectedAufgaben.First().AgsText;
            }
            _mainWindow = mainWindow;
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            if (_currentInhalt > 0)
            {
                _currentInhalt--;
            }

            Inhalt.Text = selectedInhalt[_currentInhalt].InhaltText;
        }

        private void Forth(object sender, RoutedEventArgs e)
        {
            if (_currentInhalt < selectedInhalt.Count() - 1)
            {
                _currentInhalt++;
            }

            Inhalt.Text = selectedInhalt[_currentInhalt].InhaltText;
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

            Frage.Text = selectedAufgaben.ElementAt(_currentQuestionPosition).AgsText;


        }
        private void QuestionHelp(object sender, RoutedEventArgs e)
        {

            List<int> AgsId = new List<int>();
            selectedAufgaben.ForEach(x => AgsId.Add(x.AgsId));
            MessageBox.Show(rueckmeldungen.FirstOrDefault(x =>
            x.AgsId == selectedAufgaben[_currentQuestionPosition].AgsId).RueckText);
        }

        //public static async Task Query()
        //{
        //    selectedInhalt = await (from x in ctx.Inhalt select x).ToListAsync();
        //}
    }
}
