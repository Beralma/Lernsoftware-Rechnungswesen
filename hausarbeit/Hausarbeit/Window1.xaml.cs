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
    /// Interaktionslogik für Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {

        public Window1()
        {
            InitializeComponent();

        }

        private void LanguageChange(object sender, RoutedEventArgs e)
        {
            Button clickedbutton = sender as Button;
            if (clickedbutton.Content.Equals("Deutsch")) {
                MyDataContext.switchCulture("de-DE");
            }
            else
            {
                MyDataContext.switchCulture("en-US");
            }

            Window m = new MainWindow();
            m.Show();
            this.Close();
        }

    }
}
