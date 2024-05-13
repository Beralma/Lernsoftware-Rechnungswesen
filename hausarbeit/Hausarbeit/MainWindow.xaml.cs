using Hausarbeit.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Resources;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
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
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    /// 
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
                hausarbeit_DEEntities ctx = new hausarbeit_DEEntities();

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
            else
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

        }

        private void chosenKapitel(object sender, RoutedEventArgs e)
        {
            MenuItem m = (MenuItem)sender;
            // MessageBox.Show((string)m.Header);
            Window w = new SubWindow(k.FirstOrDefault(x => x.Kapitel_Name.Equals(m.Header)).Kapitel_id,this);
            w.Show();
            w.Focus();
            this.Hide();
            
        }


    }
}
