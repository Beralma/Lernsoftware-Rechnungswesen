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
using System.Windows.Navigation;
using System.Windows.Shapes;
using static Hausarbeit.MainWindow;

namespace Hausarbeit
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static bool firstload = true;
        List<Kapitel> k = new List<Kapitel>();
        List<MenuItem> menuItems = new List<MenuItem>();
        public MainWindow()
        {
            InitializeComponent();

            //Scaffold-DbContext "Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Deutsch;Integrated Security=SSPI" 
            int count = 1;
            if (MyDataContext.mycultureinfo == "de-DE")
            {
                hausarbeit_DEContext ctx = new hausarbeit_DEContext();

                k = ctx.Kapitels.ToList();

                foreach (Kapitel kitem in k)
                {
                    MenuItem m = new MenuItem();
                    m.Header = kitem.KapitelName;
                    m.Click += new RoutedEventHandler(chosenKapitel);
                    menuItems.Add(m);
                }
                menuItems.ForEach(x => menü.Items.Add(x));

            }
           /* else
            {
                hausarbeit_ENEntitie ctx = new hausarbeit_ENEntitie();

                k = ctx.Kapitel.ToList();

                foreach (Kapitel kitem in k)
                {
                    MenuItem m = new MenuItem();
                    m.Header = kitem.Kapitel_Name;
                    m.Click += new RoutedEventHandler(chosenKapitel);
                    menuItems.Add(m);
                }
                menuItems.ForEach(x => menü.Items.Add(x));
            }
           */
        }

        private void chosenKapitel(object sender, RoutedEventArgs e)
        {
            MenuItem m = (MenuItem)sender;
            // MessageBox.Show((string)m.Header);
            Window w = new SubWindow(k.FirstOrDefault(x => x.KapitelName.Equals(m.Header)).KapitelId, this);
            w.Show();
            w.Focus();
            this.Hide();

        }


    }
}
