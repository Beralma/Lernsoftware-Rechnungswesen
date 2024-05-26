using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Markup;

namespace Hausarbeit
{
    internal class Deutsch_DB
    {
        private const string ConnectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Deutsch;Integrated Security=SSPI";
        //"Data Source = (local); Initial Catalog = Deutsch;" + "Integrated Security=SSPI;";
        public void CreateDatabaseAndInsertContent()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        ExecuteScript(connection, @"
                        USE master;
                        GO

                        IF DB_ID(N'hausarbeit_DE') IS NULL
                          CREATE DATABASE hausarbeit_DE;
                        GO

                        USE hausarbeit_DE;
                        GO
                    ");

                        ExecuteScript(connection, @"
                        DROP TABLE IF EXISTS Rueckmeldung;
                        DROP TABLE IF EXISTS Aufgabenstellung;
                        DROP TABLE IF EXISTS Inhalt;
                        DROP TABLE IF EXISTS Kapitel;

                        CREATE TABLE Kapitel (
                          Kapitel_id INT IDENTITY (1, 1) PRIMARY KEY,
                          Kapitel_Name nvarchar(100) not null
                        );

                        CREATE TABLE Inhalt (
                          Inhalt_id INT IDENTITY (1, 1) PRIMARY KEY,
                          Kapitel_id int not null,
                          Inhalt_Text ntext not null,
                          constraint fk_KapitelInhalt foreign key (Kapitel_id) references Kapitel(Kapitel_id)
                        );

                        CREATE TABLE Aufgabenstellung (
                          AGS_id INT IDENTITY (1, 1) PRIMARY KEY,
                          Inhalt_id int not null,
                          AGS_Text ntext not null,
                          constraint fk_InhaltAufgabenstellung foreign key (Inhalt_id) references Inhalt(Inhalt_id)
                        );

                        CREATE TABLE Rueckmeldung (
                          Rueck_id INT IDENTITY (1, 1) PRIMARY KEY,
                          Rueck_Text ntext not null,
                          AGS_id int foreign key references Aufgabenstellung(AGS_id)
                        );
                    ");

                        InsertContent(connection, @"
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Inventur > Inventar > Bilanz');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Eigenkapitalvergleich');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Bestandskonten');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Grundbuch');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Hauptbuch');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Erffnungs-/Schlussbilanz konto');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Erfolgskonten');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Gewinn und Verlust konto');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Lineare Abschreibung');
                        INSERT INTO Kapitel(Kapitel_Name) VALUES('Umsatzsteuer');
                    ");

                        InsertContent(connection, @"
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'
                            Inventur ist ein Prozess, bei dem die Bestände und Werte von Waren, Materialien oder Vermögenswerten eines Unternehmens erfasst und überprüft werden.
                            Dies geschieht in der Regel am Ende eines Geschäftsjahres, um eine genaue Bestandsaufnahme zu erstellen.
                            
                            Während der Inventur werden alle vorhandenen Bestände physisch gezählt, überprüft und mit den Aufzeichnungen im Lagerbestandssystem abgeglichen.
                            Ziel ist es, mögliche Abweichungen zwischen den tatsächlichen Beständen und den erwarteten Beständen zu identifizieren und zu korrigieren.
                            
                            Die Inventur ermöglicht es einem Unternehmen, die Genauigkeit seiner Bestandsaufzeichnungen zu überprüfen,
                            potenzielle Verluste oder Diebstähle aufzudecken und eine Grundlage für die finanzielle Bewertung des Unternehmens zu schaffen.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id,Inhalt_Text) VALUES (1,'
                            Es gibt verschiedene Arten der Inventur, die je nach den Bedürfnissen und Anforderungen eines Unternehmens oder einer Organisation eingesetzt werden können.
                            Hier sind einige der gängigen Arten der Inventur:
                            
                            Stichtagsinventur: Bei dieser Art der Inventur wird der Bestand an einem bestimmten Stichtag physisch gezählt.
                            Alle physischen Bestände werden erfasst, und Abweichungen zwischen den erwarteten und den tatsächlichen Beständen werden ermittelt.
                            
                            Permanente Inventur: Bei der permanenten Inventur wird der Bestand laufend und regelmäßig über das gesamte Jahr hinweg erfasst und aktualisiert.
                            Dies kann beispielsweise durch den Einsatz von Barcodescannern oder automatisierten Inventursystemen geschehen.
                            
                            Stichprobeninventur: Bei dieser Art der Inventur werden nur ausgewählte Bestände oder Teilmengen des Gesamtbestands überprüft.
                            Statt den gesamten Bestand zu zählen, werden repräsentative Stichproben genommen und die Ergebnisse auf den Gesamtbestand hochgerechnet.
                            
                            Wertmäßige Inventur: Bei der wertmäßigen Inventur wird der Bestand nicht physisch gezählt, sondern es werden lediglich die finanziellen Werte der Bestände ermittelt.
                            Dies geschieht anhand von Buchhaltungsaufzeichnungen, die den Bestand und den Wert der Artikel enthalten.
                            
                            Verlegte Inventur: Bei der verlegten Inventur wird der physische Bestand nicht am eigentlichen Lagerort gezählt, sondern an einem anderen Ort, beispielsweise in einem externen Lager oder bei einem Lieferanten.
                            Diese Art der Inventur wird oft verwendet, um den Geschäftsbetrieb nicht zu stören oder um genaue Bestandsdaten zu erhalten, wenn der normale Betrieb nicht möglich ist.
                            
                            Digitale Inventur: Bei der digitalen Inventur wird der Bestand mithilfe von Technologie und automatisierten Systemen erfasst.
                            Dies kann beispielsweise durch den Einsatz von Barcodescannern, RFID-Tags oder Inventursoftware geschehen. Die digitale Inventur ermöglicht eine schnellere und genauere Erfassung der Bestände.
                            
                            Jede Art der Inventur hat ihre Vor- und Nachteile, und die Auswahl hängt von verschiedenen Faktoren wie der Größe des Bestands,
                            der Art der Artikel, der verfügbaren Ressourcen und den spezifischen Anforderungen des Unternehmens ab.
                            Oft wird eine Kombination aus verschiedenen Inventurmethoden eingesetzt, um ein genaues und effizientes Bestandsmanagement sicherzustellen.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'
                            Das Inventar ist eine Aufstellung aller Vermögensgegenstände, Schulden und Eigenkapital eines Unternehmens zu einem bestimmten Zeitpunkt.
                            Es gibt einen Überblick über die finanzielle Situation des Unternehmens und dient als Grundlage für die Buchführung und die Erstellung von Finanzabschlüssen.
                            Das Inventar umfasst sowohl materielle Vermögenswerte wie Bargeld, Lagerbestände und Ausrüstung als auch immaterielle Vermögenswerte wie Patente und Marken.
                            Auf der Passivseite werden die Verbindlichkeiten des Unternehmens, wie Darlehen oder Lieferantenschulden, sowie das Eigenkapital aufgeführt.
                            Das Inventar wird normalerweise am Ende eines Geschäftsjahres oder zu anderen festgelegten Zeitpunkten erstellt, um eine genaue Bestandsaufnahme zu ermöglichen.
                            Es dient als Grundlage für die Bewertung des Unternehmens und die Berechnung von Kennzahlen wie dem Working Capital oder dem Nettovermögen.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'
                            Eine Bilanz ist eine finanzielle Zusammenfassung, die die Vermögenswerte, Schulden und das Eigenkapital eines Unternehmens zu einem bestimmten Zeitpunkt darstellt.
                            Sie gibt einen Überblick über die finanzielle Lage und den Wert eines Unternehmens.
                            Die Bilanz besteht aus zwei Hauptteilen: der Aktivseite und der Passivseite.
                            Auf der Aktivseite werden die Vermögenswerte des Unternehmens aufgeführt, wie zum Beispiel Bargeld, Forderungen, Vorräte, Immobilien und Investitionen. Diese zeigen, was das Unternehmen besitzt und welchen Wert es hat.
                            Auf der Passivseite werden die Schulden und das Eigenkapital des Unternehmens aufgeführt. Schulden können Verbindlichkeiten gegenüber Lieferanten, Darlehen oder andere Verpflichtungen sein.
                            Das Eigenkapital repräsentiert den Anteil der Eigentümer am Unternehmen.
                            Die Bilanzgleichung besagt, dass die Summe der Aktivseite gleich der Summe der Passivseite sein muss. Dies bedeutet, dass das Vermögen eines Unternehmens durch Schulden und Eigenkapital finanziert wird.
                            Die Bilanz ist ein wichtiges Instrument für Unternehmen, Investoren, Gläubiger und andere Stakeholder, um die finanzielle Gesundheit und Stabilität eines Unternehmens zu beurteilen.
                            Sie liefert Informationen über die Liquidität, die Verschuldung und den Wert eines Unternehmens und dient als Grundlage für finanzielle Entscheidungen und Analysen.');
                            ---------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(2,'
                            Der Eigenkapitalvergleich ist eine einfache und effektive Methode, um den Erfolg eines Unternehmens zu bewerten.
                            Es wird ein Vergleich zwischen dem Betrag am Anfang der Periode und dem Betrag am Ende der Periode durchgeführt.
                            Wenn das Eigenkapital steigt, wird dies als Eigenkapitalmehrung bezeichnet, wenn es sinkt Eigenkapitalminderung.
                            Es ist nicht erlaubt, private Einnahmen oder Entnahmen als Erhöhung oder Abnahme zu betrachten.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(2,'
                            Die Berechnung der Vermögensveränderung als Vergleich des Betriebsvermögens ist eine bedeutende Komponente bei der Steuerfestsetzung.
                            Gewerbetreibende, die für die Buchhaltung verantwortlich sind, müssen einen umfassenden Überblick über das Betriebsvermögen haben.
                            Es ist ausreichend, einen vereinfachten und nicht vollständigen Vergleich des Betriebsvermögens bei Selbstständigen durchzuführen, die freiwillig Bücher führen.');
                            ----------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
                            Die Bestandskonten werden durch die doppelte Buchführung aus der Bilanz des Unternehmens abgeleitet.
                            Jeder Posten in der Bilanz muss ein eigenes Bestandskonto geführt werden.
                            Die Konten werden als Aktiv- oder Passivkonten bezeichnet, je nachdem, aus welcher Seite der Bilanz (Aktiva oder Passiva) sie stammen.
                            Die Werte des Anlage- und Umlaufvermögens werden auf den aktiven Bestandskonten angezeigt, während die Kapitalquellen auf den passiven Bestandskonten angezeigt werden.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
                            Aktivkonten wie Gebäude, Maschinen und Fuhrpark haben Auswirkungen auf das Anlage- und Umlaufvermögen eines Unternehmens und stehen auf der Habenseite einer Bilanz als Bestandskonten.
                            Unternehmen buchen Beträge auf der Sollseite der Bestandskonten ein, wenn sie auf den Bestandskonten eingehen.
                            Unternehmen können den Fuhrpark erweitern, indem sie die Aktiv- oder Sollseite des Bestandskontos erreichen, während ein Verkauf die Passiv- oder Habenseite des Kontos betrifft.
                            Eine kurze Zusammenfassung zeigt die Idee: Die Sollseite von Aktivkonten ist für die Buchung von Zugängen zuständig, während die Habenseite für Abgänge zuständig ist.
                            Der Startbestand eines Aktivkontos liegt auf der Aktivseite, während der Endbestand auf der Passivseite liegt.
                            Passivkonten auf der Passivseite der Bilanz sind Konten wie Bankverbindlichkeiten oder Spareinlagen, die das Eigenkapital eines Unternehmens betreffen.
                            Unternehmen buchen auf passiven Bestandskonten im Gegensatz zum Aktivkonto einen Zugang auf der Passiv- oder Habenseite, während sie einen Abgang auf der Aktiv- oder Sollseite ausweisen.
                            Bei passiven Bestandskonten sind der Anfangs- und Endbestand auf der Passivseite zu finden, während bei aktiven Bestandskonten der Endbestand auf der Aktivseite zu erkennen ist.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
                            Ein Beispiel zeigt die Buchung auf einem Bestandskonto:
                            Ein Unternehmen kauft ein Auto für 15.000 Euro und überweist den Preis per Überweisung vom Bankkonto.
                            Bei der doppelten Buchführung muss jede Buchung auf einem Bestandskonto im Soll mit einer entsprechenden Buchung im Haben übereinstimmen, was zu zwei Konten führt.
                            Durch die Anschaffung steigt der Bestand auf der Aktivseite des Bestandskontos Fuhrpark um 15.000 Euro, während sich das Bankguthaben auf der Aktivseite des Bestandskontos um 15.000 Euro verringert.
                            Sobald eine Buchung auf einem Bestandskonto im Soll durchgeführt wird, wird eine entsprechende Habenbuchung auf einem anderen Konto durchgeführt.
                            Es ist erforderlich, bei jeder Buchung das passende Gegenkonto anzugeben.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
                            Im Rahmen der Inventur zum Ende des Geschäftsjahres sind Unternehmen gemäß den Bestimmungen des Handelsgesetzbuchs verpflichtet, die Schlussbestände der Bestandskonten zu ermitteln, um sie in der Bilanz auszuweisen.
                            Da sich der Schlussbestand aus der Differenz zwischen Soll- und Habenseite ergibt, wird dieser Prozess auch als Saldieren bezeichnet.
                            Die Differenz zwischen Soll- und Habenseite bildet den Schlussbestand der Aktivkonten, während der Endsaldo der Passivkonten aus der Differenz zwischen Haben- und Sollseite entsteht.
                            Es ist von Bedeutung, im Voraus Unterschiede in der Bestände zu vermeiden.');
                            ------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'
                            Das Grundbuch, auch bekannt als Journal, listet alle Ereignisse im Unternehmen in einer geordneten Reihenfolge auf.
                            Die Grundlage dafür sind Dokumente wie Rechnungen oder Quittungen.
                            Die chronologische Auflistung soll dazu beitragen, dass die Behörden leichter daran arbeiten können, eventuelle Untersuchungen durchzuführen.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'
                            Vor der Digitalisierung bestand die Buchhaltung tatsächlich aus mehreren physischen Büchern.
                            Dieser Aspekt der elektronischen Buchführung ist etwas vernachlässigt worden, jedoch werden auch die verschiedenen Bücher immer noch durch zeitgemäße Software-Lösungen behandelt.
                            Dies umfasst vor allem das Grundbuch, das Hauptbuch und zahlreiche Nebenbücher.
                            
                            Das Ziel des Grundbuchs besteht darin, alle Ereignisse im Geschäftsleben in chronologischer Reihenfolge aufzulisten.
                            Außerdem sind Eröffnungs-, laufende-, vorbereitende- und Abschlussbuchungen enthalten.
                            Die Idee, dass Unternehmen ihre Geschäftsvorfälle chronologisch organisieren, macht es den Behörden deutlich einfacher, Überprüfungen durchzuführen.
                            Normalerweise müssen die Merkmale eines Unternehmensvorfalls im Grundbuch festgehalten werden:
                            
                            Datum
                            Nummer des Belegs
                            Habenkonto
                            Sollkonto
                            Betrag
                            Buchungstext');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'
                            Um das Grundbuch überhaupt zu erstellen, ist es notwendig, Belege für alle Geschäftsvorfälle aufzubewahren.
                            Es kann beispielsweise um Kundenrechnungen, Kontoauszüge oder Kassenbelege gehen.
                            Es ist von entscheidender Bedeutung, dass jeder im Grundbuch aufgeführte Geschäftsvorfall durch einen ausreichenden Nachweis nachgewiesen werden kann.
                            Falls es keine Rechnung oder Quittung zu einer aufgeführten Belegnummer gibt, wird der Eintrag vom Finanzamt nicht akzeptiert.
                            Die einzelnen Geschäftsvorfälle werden dann aus dem Grundbuch in das Hauptbuch übertragen.
                            Wie der Name vermuten lässt, dient das Grundbuch als Basis für die Buchhaltung.
                            Die Geschäftstransaktionen werden im Hauptbuch einzelnen Sachkonten – Bestands- und Erfolgskonten – zugeordnet.
                            Es ist von Bedeutung für den Gesetzgeber, da die einzelnen Ereignisse nicht nur chronologisch, sondern auch sachlich geordnet werden müssen.
                            Letztendlich besteht das Hauptbuch aus den Sachkonten, die im Kontenplan aufgeführt sind.');
                            -------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(5,'
                            Die Buchführung besteht aus dem Hauptbuch.
                            Das Hauptbuch überträgt geschäftliche Ereignisse aus dem Grundbuch, um eine angemessene Ordnung aller Buchungen auf Sachkonten zu schaffen.
                            
                            Die doppelte Buchführung umfasst das Hauptbuch, in das alle geschäftlichen Ereignisse sorgfältig und angemessen dokumentiert werden.
                            Grund dafür ist das Journal, welches alle Ereignisse im Geschäft immer noch chronologisch geordnet hat.
                            Damit das Hauptbuch als Grundlage der Bilanz dienen kann, muss es das Prinzip der Geschlossenheit befolgen.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(5,'
                            Das Hauptbuch besteht aus Sachkonten, die bestimmte Geschäftsvorfälle nach ihrer Ursache ordnen.
                            Grund dafür ist das Journal, in das alle Ereignisse in ihrer chronologischen Reihenfolge dokumentiert werden.
                            Es gibt drei verschiedene Möglichkeiten, die Übertragung durchzuführen:
                            
                            Führung und Abschluss des Hauptbuchs
                            Normalerweise wird das Hauptbuch gemäß den Vorlagen des Industriekontenrahmens, des Standardkontenrahmens oder des Gemeinschaftskontenrahmens aufgebaut.
                            Die Bilanz entsteht automatisch, nachdem alle Sachkonten und das Hauptbuch geschlossen wurden.
                            Mit dem Abschluss des Hauptbuchs wird auch die Gewinn- und Verlustrechnung direkt erstellt.
                            
                            Daher sieht der Gesetzgeber vor, dass das Prinzip der Geschlossenheit im Hauptbuch berücksichtigt wird.
                            Das bedeutet offiziell, dass es zu einem Ausgleich zwischen dem Soll- und dem Haben kommt.
                            Es ist erforderlich, dass die Summe aller Sollposten exakt der Summe aller Habenposten entspricht.
                            Es ist auch wichtig, dass es auch materielle Geschlossenheit gibt, was bedeutet, dass das Hauptbuch tatsächlich alle geschäftlichen Ereignisse einer bestimmten Zeitspanne dokumentiert.
                            ');
                            -------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(6,'
                            Die Schlussbilanz ist eine Zusammenfassung der finanziellen Situation eines Unternehmens zu einem bestimmten Zeitpunkt, in der alle Vermögenswerte, Schulden und das Eigenkapital aufgeführt werden.
                            Sie wird auch als Abschlussbilanz, Schlussrechnung oder Schlusskonto bezeichnet.')
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(6,'
                            Die Eröffnungsbilanz ist eine Bilanz, die zu Beginn eines neuen Geschäftsjahres oder bei Gründung eines Unternehmens erstellt wird.
                            Sie dient als Ausgangspunkt für die Buchführung und gibt einen Überblick über die finanzielle Situation des Unternehmens zu diesem Zeitpunkt.');
                            --------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
                            Es gibt viele verschiedene Begriffe im Bereich der Finanzen und Buchhaltung. Schnell kann dies zu Verwirrung führen.
                            Es ist von entscheidender Bedeutung, die exakte Bedeutung eines Begriffes zu verstehen und seine Anwendung zu verstehen.
                            Es ist möglich, dass Sie in der Rechnungslegung bereits von dem Begriff des Erfolgskontos gehört haben.
                            Was ist das genau, und was müssen Sie beachten, wenn Sie ein Erfolgskonto buchen? ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
                            Erfolgskonten sind ein Unterkonto des Eigenkapitalkontos und sind ein Teil der doppelten Buchführung.
                            Das Eigenkapitalkonto ist ein Konto, das als passiv betrachtet wird.
                            
                            Die Erfassung von Gewinnen und Verlusten am Ende des Jahres wird durch die doppelte Buchführung durchgeführt.
                            Neben Kleinunternehmen und Selbstständigen sind alle Unternehmen verpflichtet, eine doppelte Buchführung durchzuführen.
                            Gemäß dem Handelsgesetzbuch werden Kleinunternehmen definiert, wenn ihr Umsatz im letzten Jahr unter 17.500€ lag und der Umsatz für das kommende Geschäftsjahr nicht höher als 60.000€ erwartet wird.
                            
                            Bestandskonten und Erfolgskonten sind die zwei Hauptkategorien der doppelten Buchführung.
                            Erfolgskonten verbuchen Erträge und Aufwendungen, während Bestandskonten das Vermögen eines Unternehmens wie beispielsweise Grundstücke und Schulden beschreiben.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
                            Nun gehen wir noch einmal detaillierter auf die Unterschiede zwischen den beiden Konten ein:
                            Wie kann man ermitteln, welcher Geschäftsvorfall auf welches Konto registriert wird?
                            
                            Die Bestandskonten werden für alle Ereignisse gebucht, die den Bestand eines Unternehmens verändern.
                            Dies kann beispielsweise die Anschaffung von Geräten oder die Zahlung einer Rechnung per Banküberweisung beinhalten.
                            Daher werden auf Bestandskonten erfolgsneutrale Geschäftsvorfälle verbucht, was bedeutet, dass alle Vorfälle, die keinen Einfluss auf den Gewinn des Unternehmens haben, auf Bestandskonten verbucht werden.
                            
                            Im Gegensatz dazu werden geschäftliche Ereignisse auf Erfolgskonten gemeldet, die keinen Einfluss auf den Bestand haben und erfolgreich sind.
                            Der Gewinn eines Unternehmens wird durch erfolgreiche Vorgänge beeinflusst.
                            
                            Ein weiterer bedeutender Unterschied besteht darin, dass die Gewinn- oder Verlustrechnung jedes Jahr mit dem Endbestand des vorherigen Geschäftsjahres fortgesetzt wird, während die Gewinn- oder Verlustrechnung jedes Jahr erfolgt und daher von 0 anfängt.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
                            Wir unterscheiden das Ertrags- und das Aufwandskonto bei den Erfolgskonten.
                            Alle positiven Wertveränderungen werden auf Ertragskonten verbucht, während alle negativen Wertveränderungen auf Aufwandskonten verbucht werden.
                            Daher erhöhen Erträge das Eigenkapital, während Aufwendungen es verringern.
                            Mieteinnahmen sind ein Beispiel für Buchungen auf dem Ertragskonto, während der Verbrauch von Rohstoffen auf dem Aufwandskonto verbucht wird.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
                            In der doppelten Buchführung wird jeder Geschäftsvorfall auf einem einzelnen Konto und einem anderen Konto verbucht.
                            Man kann auch die Wörter ""Müssen"" und ""Besitzen"" verwenden.
                            Für eine sorgfältige und korrekte Buchführung ist es entscheidend, die Begriffe zu definieren und sorgfältig zu verstehen.
                            
                            Die Vermögensverwendung und -herkunft werden von Soll beschrieben.
                            Aufgrund der Tatsache, dass die Erfolgskonten als passive Konten gelten, werden alle Gewinne im Besitz und alle Ausgaben im Plan gebucht.
                            Immer steht Soll auf der linken Seite und Haben auf der rechten.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
                            Die Salden der beiden Konten müssen zuerst gebildet werden. Alle Sollsalden im Aufwandskonto werden addiert, um den Saldo zu erhalten.
                            Alle Habensalden werden im Ertragskonto addiert, um den Saldo zu erhalten.
                            Wir beziehen uns hier auf die Buchungssätze «Ertragskonten an GuV-Konto» und «GuV-Konten an Aufwandskonten».
                            
                            Anschließend erstellen wir den Saldo des GuV-Kontos und übernehmen ihn in das Eigenkapitalkonto.
                            Der Saldo des GuV-Kontos zeigt an, ob das Unternehmen einen Gewinn oder einen Verlust erzielt hat.
                            Im Fachbereich wird auch der Begriff Jahresüberschuss oder Jahresfehlbetrag verwendet.');
                            --------------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
                            Es besteht die Möglichkeit, dass der Aufbau und die Struktur der GuV variieren.
                            Es besteht die Option, die GuV in Kontenform oder in gestaffelter Form zu erstellen.
                            Es gibt eine Unterscheidung zwischen der Soll- und Habenseite (Ausgaben/Erträge) im Kontenformat.
                            Falls ein Saldo auf der Soll-Seite entsteht, wird ein Gewinn erzielt.
                            Wenn jedoch ein positives Ergebnis auf der finanziellen Seite auftritt, liegt ein Verlust vor. 
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
                            Die Gewinn- und Verlustrechnung vergleicht alle Kosten und Erträge für einen bestimmten Zeitraum.
                            Dies kann ein Quartal oder das gesamte Geschäftsjahr sein. Da es sich um ein Konto auf der Passivseite der Bilanz handelt, werden die Erträge im Saldo gebucht und die Aufwendungen im Soll.
                            Am Ende des bestimmten Zeitraums wird der Gewinn oder Verlust aus der GuV berechnet und dann auf das Konto Eigenkapital übertragen.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
                            Die GuV stellt keine eindeutige Erfolgsspaltung im betriebswirtschaftlichen Sinn dar,
                            da es nicht erforderlich ist, die Aufwendungen und Erträge in betriebsfremde und betriebliche sowie in einmalige und regelmäßige periodeneigene und periodenfremde Kategorien zu unterteilen.
                            
                            Es ist notwendig, nicht nur die Daten des letzten Geschäftsjahres gemäß HGB und IFRS (Internationale Rechnungslegungsstandards)
                            zu präsentieren, sondern auch die Werte des Vorjahres und sogar die Werte der letzten drei Jahre gemäß US-GAAP.
                            Falls eine Stelle im aktuellen Jahr nicht besetzt wird, wird sie als unbesetzt aufgeführt.
                            Es ist von großer Bedeutung, dass die Beträge vergleichbar sind.
                            Falls dies nicht der Fall ist, muss eine Erklärung im Anhang enthalten sein.');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
                            Eine Abschreibung ist die Abnutzung eines Vermögensgegenstandes im Rechnungswesen, also der ""Werteverzehr"".
                            Die Kosten für die Anschaffung und Herstellung dieser Gegenstände werden bei einer Abschreibung auf die Jahre der Nutzung des Anlagevermögens verteilt.
                            Folglich wird der Gewinn von einer Abschreibung durch den Aufwand verringert, wie es im HGB festgelegt ist. ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
                            Jeden Geschäftsjahr muss der Kaufmann gemäß § 242 HGB eine Aufstellung seiner Aufwendungen und Erträge vorlegen.
                            Wenn es um den formalen Aufbau geht, enthalten die internationalen Rechnungslegungsstandards wie die International Financial Reporting Standards (IFRS)
                            und die United States Generally Accepted Accounting Principles (US-GAAP) detaillierte Regeln.
                            
                            Viele Unternehmen erstellen monatlich eine GuV und eine vollständige Bilanz, und das bereits wenige Tage nach Ultimo (lestzter tag des Monats).
                            Dies ermöglicht dem Unternehmer, einen aktuellen Einblick in die Entwicklung seines Geschäftsjahres zu erhalten.
                            Es ist möglich, Unerwartungen am Ende des Geschäftsjahres zu vermeiden und Fehler frühzeitig zu verhindern.
                            Außerdem besteht die Möglichkeit, dass die besonderen Ereignisse, die für die Finanzen relevant sind,
                            angemessen auf die einzelnen Monate aufgeteilt werden können, wie z. B. umfangreiche Reparaturen, Forderungsausfälle oder Betriebsferien.
                            ');
                            -------------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
                            Ein Unternehmer muss Umsatzsteuer auf seine Einnahmen zahlen. Im täglichen Leben ist sie besser bekannt als die Mehrwertsteuer,
                            obwohl die Bezeichnung ungenau ist. Die Vorsteuer ist die gleiche Steuer aus der Perspektive des Käufers. ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
                            Unternehmer zahlen auf Umsätze Steuern
                            Muss auf Kassenbons & Rechnungen explizit ausgewiesen werden
                            In Deutschland: 19 % oder 7 %
                            Steuer muss vom Unternehmen an das Finanzamt abgeführt werden
                            Umsatzsteuer = Verbindlichkeit gegenüber dem Finanzamt');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
                            Die gleiche Steuer wie die Umsatzsteuer
                            Aus einer anderen Perspektive
                            Steuer, die ein Unternehmer zahlt, wenn er Waren oder Dienstleistungen von einem anderen Unternehmer einkauft
                            Umsatzsteuer des verkaufenden Unternehmens = Vorsteuer des kaufenden Unternehmens
                            Käufer, der die Vorsteuer zahlen muss, kann diese wieder vom Finanzamt zurückfordern
                            Vorsteuer = Forderung gegenüber dem Finanzamt');
                            -----------------------------------------------------------------------------------------
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            In einem Unternehmen haben die meisten Anlagegüter nur eine begrenzte Lebensdauer.
                            Dies gilt auch für sehr wertvolle Wirtschaftsgüter, die mit hohen Anschaffungskosten oder Herstellungskosten verbunden sind.
                            Laut dem Abschreibungsprinzip ist es erlaubt, dass nur ein Teil der Kosten für die Anschaffung eines Vermögenswertes jährlich von der Steuer abgesetzt oder in einer Gewinn- und Verlustrechnung und im Jahresabschluss eines Unternehmens vermerkt wird.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            Abschreibungen gemäß EStG
                            Abschreibungen sind gesetzlich erforderlich. Gemäß EStG (Einkommensteuergesetz) müssen die Anschaffungskosten und Herstellungskosten bei Wirtschaftsgütern,
                            die für die Erzielung von Einkünften verwendet werden und erfahrungsgemäß länger als ein Jahr genutzt werden, über die Nutzungsdauer gleichmäßig verteilt werden.
                            
                            Es ist erforderlich, dass die Kosten für die Anschaffung und Herstellung von Wirtschaftsgütern, die abschreibungsfähig sind, eine bestimmte Grenze erreichen.
                            Es ist offensichtlich, dass die lineare Abschreibung der gesetzliche Normalfall ist, da die Absetzung über die Nutzungsdauer gleichmäßig verteilt ist.
                            Es ist nicht mehr erlaubt, die degressive Abschreibung, die früher auch üblich war, auf Wirtschaftsgüter zu verwenden, die nach dem Jahr 2010 erworben wurden.
                            
                            Abschreibungen gemäß HGB
                            Die Bewertungsgrundsätze des Handelsgesetzbuches (HGB) für die Vermögensgegenstände, die im Jahresabschluss aufgeführt sind,
                            weisen auch darauf hin, dass Unternehmen planmäßige Abschreibungen vornehmen müssen.
                            
                            Deshalb reduzieren Abschreibungen den Gewinn eines Unternehmens,
                            selbst wenn in einem bestimmten Jahr keine Anschaffungskosten oder Herstellungskosten angefallen sind.
                            Im Gegensatz dazu steigert das Abschreibungsprinzip den Gewinn im Jahr des Kaufs. Die Kosten für die Anschaffung des Artikels können in diesem Jahr nicht vollständig berücksichtigt werden.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            Abschreibungen sind auch in der Betriebswirtschaft sinnvoll, da das Unternehmen jedes Jahr die Kosten für die Herstellung oder den Kauf neuer Vermögensgegenstände zurücklegen kann,
                            falls die abgeschriebenen Gegenstände tatsächlich nicht mehr verwendet werden können.
                            Abschreibungen können auch verwendet werden, um Wertverluste beim Anlagevermögen und Umlaufvermögen im Rechnungswesen zu ermitteln.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            Im Steuer- und Bilanzrecht ist die lineare Abschreibung eine übliche Abschreibungsform. jährliche Erfassung der Wertminderung mit konstanten Beträgen.
                            Die direkte Abschreibung ist eine Methode der Buchhaltung, bei der das Anlagenkonto durch die Abschreibung reduziert wird.
                            Die Methode der Leistungsabschreibung wird verwendet, um Anlagegüter abzuschreiben, deren Leistung erfahrungsgemäß stark variiert.
                            Planmäßige Abschreibung ist die Abschreibung über eine vorher festgelegte Nutzungsdauer, die sich teilweise an gesetzlichen Vorgaben orientiert .
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            Grundsätzlich unterscheidet man zwischen der linearen Abschreibung und der degressiven Abschreibung.
                            Die degressive Abschreibung dagegen hat zur Folge, dass die einzelnen Beträge für die Abschreibungen jedes Jahr geringer ausfallen.
                            Denn hier orientiert sich der Satz für die Abschreibung immer am aktuellen Restbuchwert– der ja wiederum jedes Jahr durch die Abschreibungen fällt.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            Direkte und indirekte Abschreibungsmethoden
                            Im Rechnungswesen gibt es zwei Arten von Abschreibungsmethoden: die direkte und die indirekte Abschreibung.
                            Direkte Abschreibung bedeutet, den Vermögensposten auf der Passivseite zu reduzieren.
                            Anders ist es bei der indirekten Abschreibung, bei der alle Abschreibungen zusammengetragen und als Wertberichtigung auf der Aktiv- und Passivseite dargestellt werden.
                            
                            Leistungsbezogene Abschreibung
                            Abschreibung nach Leistung hängt von der Nutzung eines Wirtschaftsguts ab.
                            Abschreibungen auf Basis von Leistungen sind besonders vorteilhaft bei Investitionsgütern, die stark in ihrer Nutzung schwanken.
                            Sie werden beispielsweise in Fahrzeugen angeboten. 
                            
                            Außerplanmäßige Abschreibung
                            Die außerplanmäßige Abschreibung erfasst Wertverluste in einem Unternehmen, die nicht durch planmäßige Nutzung verursacht wurden.
                            
                            Besonderheiten der unvorhergesehenen Abschreibung
                            Obwohl im Rechnungswesen im Allgemeinen keine Unterschiede zwischen außerplanmäßiger und planmäßiger Absetzung der Güter bestehen,gibt es einige Besonderheiten.
                            Es besteht die Möglichkeit, eine außerplanmäßige Abschreibung sowohl bei Anlagen als auch im Umlaufvermögen vorzunehmen.
                            Teilabschreibungen sind im Steuerrecht außerplanmäßige Abschreibungen.
                            
                            Kalkulatorische Abschreibung
                            Die kalkulatorische Abschreibung bezieht sich nicht auf die bilanzielle Abschreibung, sondern auf den tatsächlichen Wertverlust des Sachanlagevermögens.
                            Der Sinn einer kalkulatorischen Abschreibung besteht darin, dass in einem Unternehmen tatsächliche Kosten entstehen, die bei der Berechnung von Gewinnen und Verlusten nicht erscheinen.
                            ');
                            
                            INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
                            Wer unsicher ist, wie lange eine Nutzungsdauer für bestimmte Wirtschaftsgüter benötigt wird, kann auf AfA-Tabellen zurückgreifen.
                            Das Bundesministerium für Finanzen stellt sie her. Allerdings sind sie nicht verbindlich und dienen lediglich als Unterstützung.
                            Die Nutzungsdauer, die in diesen Tabellen angegeben ist, kann je nach Situation vom Unternehmer abweichen.')
                            ;");

                        InsertContent(connection, @"
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Was ist der Zweck der Inventur und warum ist sie für Unternehmen wichtig?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Arten von Inventurverfahren werden verwendet?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche möglichen Maßnahmen können ergriffen werden, um die Effizienz und Genauigkeit der Inventur zu verbessern?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Wie wird die Genauigkeit und Vollständigkeit der Inventur sichergestellt?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Vermögensgegenstände sind im Inventar enthalten?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Verbindlichkeiten sind im Inventar aufgeführt?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Wird das Inventar regelmäßig aktualisiert und angepasst?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche mögliche Informationen liefert das Inventar über die finanzielle Situation des Unternehmens?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Was ist eine Bilanz und welche Informationen liefert sie über ein Unternehmen?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Vermögenswerte sind in der Bilanz aufgeführt?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Verbindlichkeiten und Eigenkapitalpositionen sind in der Bilanz enthalten?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Wie wird die Bilanzstruktur aufgebaut und welche Bestandteile hat sie?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(2,'Was ist der Eigenkapitalvergleich und welche Informationen bietet er über die finanzielle Position eines Unternehmens?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(2,'Wie nennt man eine erhöhung order verringerung des Eigenkapitals?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(2,'Wie hat sich das Eigenkapital im Vergleich zum Vorjahr/der Vorperiode verändert und was sind die Gründe für diese Veränderungen?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Welche Arten von Bestandskonten gibt es und wie unterscheiden sie sich voneinander?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Wo werden Zugänge auf Bestandskonten erfasst?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Wie werden Schlussbestände auf Bestandskonten erfasst?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Wie werden Bestandskonten mit anderen Konten in der Buchhaltung verknüpft, z. B. mit dem Kassenkonto oder dem Verkaufskonto?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Was ist das Grundbuch und welche Funktion erfüllt es in der Buchhaltung?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Welche Arten von Konten werden im Grundbuch geführt und wie unterscheiden sie sich voneinander?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Wie werden Buchungen möglicherweise im Grundbuch erfasst und wie erfolgt die Dokumentation?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Wie wird das Grundbuch mit anderen Konten in der Buchhaltung verknüpft?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(5,'Was ist das Hauptbuch und welche Funktion erfüllt es in der Buchhaltung?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(5,'Wie werden Buchungen im Hauptbuch erfasst und dokumentiert?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(5,'Wie können mögliche Fehler im Hauptbuch identifiziert und korrigiert werden?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(6,'Was ist eine Eröffnungsbilanz und welche Informationen enthält sie?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(6,'Was ist eine Schlussbilanz und welche Informationen enthält sie?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Was sind Erfolgskonten und welche Rolle spielen sie in der Buchhaltung?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Welche Arten von Erfolgskonten gibt es und wie werden sie kategorisiert?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Wie werden Erlöse und Kosten den entsprechenden Erfolgskonten zugeordnet?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Wie werden Gewinne und Verluste in Erfolgskonten behandelt und verbucht?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Welche Auswirkungen haben Erfolgskonten auf die Gewinn- und Verlustrechnung?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Was ist das Gewinn- und Verlustkonto und welche Funktion erfüllt es in der Buchhaltung?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Welche Arten von Einnahmen und Ausgaben werden im Gewinn- und Verlustkonto erfasst?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Wie wird der Gewinn oder Verlust eines Unternehmens im Gewinn- und Verlustkonto ermittelt?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Welche Informationen liefert das Gewinn- und Verlustkonto für die finanzielle Analyse und Berichterstattung?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Was sind Abschreibungen und warum sind sie in der Buchhaltung wichtig?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Welche Arten von Abschreibungen gibt es?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Welche Auswirkungen haben Abschreibungen auf die Gewinn- und Verlustrechnung und die Bilanz eines Unternehmens?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Wie können Abschreibungen im Rahmen der Steuerplanung optimiert werden?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(10,'Welche Arten von Umsatzsteuersätzen gibt es und wie werden sie angewendet?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(10,'Was ist Vorsteuer und wie wird sie mit der Umsatzsteuer verknüpft?');
                        INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(10,'Wie werden Umsatzsteuer und Vorsteuer möglicherweise in der Finanzanalyse verwendet, um die finanzielle Leistung eines Unternehmens zu bewerten?');

                    ");

                        InsertContent(connection, @"
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(1,'Die Inventur ist für Unternehmen aus mehreren Gründen wichtig

                        Erfüllung rechtlicher Anforderungen: In vielen Ländern sind Unternehmen gesetzlich verpflichtet, eine Inventur durchzuführen. Dies dient der Einhaltung von steuerlichen Vorschriften, Rechnungslegungsstandards und handelsrechtlichen Bestimmungen.
                        Diebstahl oder Lagerfehler, identifiziert werden. Es hilft auch bei der Vermeidung von Überbeständen oder Engpässen, indem der Bestand effizient verwaltet werden kann.
                        Grundlage für finanzielle Berichterstattung und Analyse: Die Inventur liefert Daten, die in den Jahresabschluss des Unternehmens einfließen. Diese Daten dienen der finanziellen Berichterstattung und werden von Investoren, Gläubigern und anderen Interessengruppen zur Bewertung der finanziellen Lage und Leistungsfähigkeit des Unternehmens verwendet.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(2,'Es gibt verschiedene Arten von Inventurverfahren, die in Unternehmen verwendet werden. Die Auswahl des geeigneten Verfahrens hängt von der Art des Unternehmens, der Größe des Bestands und den rechtlichen Anforderungen ab. Hier sind einige gängige Inventurverfahren:
                        Stichtagsinventur: Bei der Stichtagsinventur wird der Bestand an einem bestimmten Stichtag physisch erfasst.
                        Permanente Inventur: Bei der permanenten Inventur erfolgt die Erfassung des Bestands laufend und fortlaufend während des gesamten Geschäftsjahres. Dadurch wird eine regelmäßige und kontinuierliche Überwachung des Bestands ermöglicht.
                        Stichprobeninventur: Bei der Stichprobeninventur wird nur eine repräsentative Auswahl des Bestands überprüft. Anhand dieser Stichproben werden Schätzungen für den Gesamtbestand erstellt.
                        Wertmäßige Inventur: Bei der wertmäßigen Inventur wird der Bestand nicht physisch erfasst, sondern es werden lediglich die Werte der Vermögensgegenstände und Verbindlichkeiten ermittelt. Dies kann zum Beispiel durch Schätzungen, Kalkulationen oder andere Bewertungsmethoden erfolgen.
                        Teilinventur: Bei der Teilinventur wird nur ein Teil des Bestands erfasst und überprüft. Dies kann entweder aufgrund von praktischen Gründen oder aufgrund der Kategorisierung des Bestands erfolgen.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(3,'Die Genauigkeit und Vollständigkeit der Inventur kann durch verschiedene Maßnahmen sichergestellt werden. Hier sind einige Möglichkeiten:
                        
                        Gründliche Vorbereitung
                        Verwendung von Inventurverfahren
                        Sorgfältige physische Bestandserfassung
                        Einsatz technologischer Hilfsmittel
                        Kontrollen und Plausibilitätsprüfungen
                        Unabhängige Überprüfung
                        Dokumentation
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(4,'Um die Effizienz und Genauigkeit der Inventur zu verbessern, können Unternehmen verschiedene Maßnahmen ergreifen.
                        Vorbereitung und Planung
                        Verwendung technologischer Hilfsmittel
                        Klare Kennzeichnung und Lagerorganisation
                        Revisionsprüfung
                        Dokumentation und Nachvollziehbarkeit');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(4,'Im Inventar eines Unternehmens sind in der Regel verschiedene Vermögensgegenstände enthalten. Diese können je nach Art des Unternehmens und der Branche variieren, aber typischerweise umfassen sie folgende Kategorien von Vermögensgegenständen:
                        
                        Sachanlagen: Hierzu gehören Gebäude, Grundstücke, Maschinen, Fahrzeuge, Büromöbel und andere materielle Vermögenswerte, die für den Geschäftsbetrieb genutzt werden.
                        Vorräte: Dies umfasst Rohmaterialien, Halbfertigprodukte und Fertigwaren, die zum Verkauf bestimmt sind oder für die Produktion verwendet werden.
                        Forderungen: Hierunter fallen offene Rechnungen und Forderungen gegenüber Kunden und anderen Personen oder Unternehmen, die dem Unternehmen Geld schulden.
                        Beteiligungen und Wertpapiere: Dies beinhaltet Investitionen des Unternehmens in andere Unternehmen, Aktien, Anleihen oder andere Arten von Wertpapieren.
                        Liquide Mittel: Dies umfasst Bargeld, Bankguthaben, Schecks und andere kurzfristig verfügbare Geldmittel des Unternehmens.
                        Geistiges Eigentum: Hierzu gehören Patente, Marken, Urheberrechte und andere immaterielle Vermögenswerte, die dem Unternehmen gehören und einen finanziellen Wert haben.
                        Sonstige Vermögensgegenstände')
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(5,'Kurzfristige Verbindlichkeiten: Hierzu gehören Verbindlichkeiten, die innerhalb eines Jahres oder weniger fällig werden, wie beispielsweise Lieferantenverbindlichkeiten, offene Rechnungen, kurzfristige Kredite oder Darlehen und Verbindlichkeiten aus Lohn- und Gehaltszahlungen.
                        Langfristige Verbindlichkeiten: Dies beinhaltet Verbindlichkeiten, die über einen Zeitraum von mehr als einem Jahr fällig werden, wie beispielsweise langfristige Kredite, Darlehen, Hypotheken oder Anleihen.
                        Rückstellungen: Dies sind Verbindlichkeiten, die aus zukünftigen Verpflichtungen resultieren, wie beispielsweise Rückstellungen für Garantien, Pensionsverpflichtungen, Steuerrückstellungen oder rechtliche Verpflichtungen.
                        Verbindlichkeiten gegenüber Mitarbeitern: Hierunter fallen Verbindlichkeiten aus Lohn- und Gehaltszahlungen, Sozialabgaben, Urlaubsansprüchen oder anderen Vergütungsverpflichtungen gegenüber den Mitarbeitern.
                        Verbindlichkeiten gegenüber anderen Unternehmen oder Personen: Dies umfasst Verbindlichkeiten, die gegenüber Lieferanten, Dienstleistern, Kreditgebern, Banken oder anderen Gläubigern bestehen, beispielsweise ausstehende Rechnungen, Kredite oder Leasingverpflichtungen.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(6,'Ja, das Inventar wird in der Regel regelmäßig aktualisiert und angepasst.
                        Die Aktualisierung des Inventars ist wichtig, um sicherzustellen, dass die aufgeführten Vermögensgegenstände und Verbindlichkeiten korrekt und aktuell sind.
                        Die Häufigkeit der Aktualisierung kann je nach Unternehmen variieren und hängt von verschiedenen Faktoren ab, wie zum Beispiel der Art der Geschäftstätigkeit, der Größe des Unternehmens und den geltenden gesetzlichen Anforderungen.
                        
                        Im Allgemeinen gibt es bestimmte Anlässe oder Ereignisse, die eine Aktualisierung des Inventars erfordern:
                        Anschaffung oder Verkauf von Vermögensgegenständen
                        Inventur oder Bestandsaufnahme
                        Änderungen bei Verbindlichkeiten
                        Wertanpassungen
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(7,'Vermögenswerte
                        Verbindlichkeiten
                        Eigenkapital
                        Liquidität
                        Vermögensstruktur
                        Wertentwicklung');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(8,'Eine Bilanz ist ein wichtiger Bestandteil des Jahresabschlusses eines Unternehmens und gibt einen Überblick über die finanzielle Situation zu einem bestimmten Zeitpunkt. Die Aktivseite zeigt die Vermögenswerte des Unternehmens, während die Passivseite die Verbindlichkeiten und das Eigenkapital darstellt.
                        
                        Bilanzstruktur: Die Bilanzstruktur zeigt die Aufteilung der Vermögenswerte, Verbindlichkeiten und des Eigenkapitals in verschiedene Kategorien oder Unterkonten. Dies ermöglicht eine detailliertere Analyse der finanziellen Position und der Vermögensstruktur des Unternehmens.
                        Liquidität: Durch die Bilanz kann man Rückschlüsse auf die Liquidität des Unternehmens ziehen, d.h. die Fähigkeit, kurzfristige Verpflichtungen zu erfüllen. Indikatoren wie der Bargeldbestand, kurzfristige Forderungen und kurzfristige Verbindlichkeiten geben Aufschluss über die Liquiditätslage des Unternehmens.
                        ')
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(9,'Sachanlagen: Hierzu gehören Gebäude, Grundstücke, Maschinen, Fahrzeuge und andere physische Vermögenswerte, die für den Geschäftsbetrieb genutzt werden.
                        Immaterielle Vermögenswerte: Dies umfasst geistiges Eigentum wie Patente, Lizenzen, Markenrechte, Urheberrechte, Software und andere nicht-physische Vermögenswerte, die einen wirtschaftlichen Nutzen für das Unternehmen darstellen.
                        Vorräte: Rohstoffe, Zwischenprodukte, fertige Waren, Handelswaren und andere Bestände, die zur Produktion von Gütern oder zum Verkauf gehalten werden.
                        Forderungen: Dies sind ausstehende Beträge, die das Unternehmen von Kunden oder anderen Parteien noch zu erhalten hat.
                        Liquide Mittel: Bargeld, Bankguthaben, Schecks und andere kurzfristig verfügbare Mittel, die leicht in Zahlungsmittel umgewandelt werden können.
                        Anlagevermögen: langfristige Investitionen');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(10,'Kurzfristige Verbindlichkeiten: Verbindlichkeiten, die innerhalb eines Jahres fällig werden, wie Lieferantenverbindlichkeiten, Kreditoren, kurzfristige Darlehen, Kreditkartenverbindlichkeiten und sonstige kurzfristige Verbindlichkeiten.
                        Langfristige Verbindlichkeiten: Verbindlichkeiten, deren Rückzahlung erst nach einem Jahr oder länger fällig wird, wie langfristige Darlehen, Anleihen, Hypotheken und andere langfristige Verbindlichkeiten gegenüber Gläubigern.
                        Eigenkapital');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(11,'Die Bilanz ist eine finanzielle Darstellung, die die Vermögenswerte, Verbindlichkeiten und Eigenkapitalpositionen eines Unternehmens zu einem bestimmten Zeitpunkt widerspiegelt. Die Bilanzstruktur besteht aus zwei Hauptteilen: der Aktivseite (auch als Vermögensseite bezeichnet) und der Passivseite (auch als Kapitalseite bezeichnet).
                        Aktivseite (Vermögensseite): Anlagevermögen: Hier werden langfristige Vermögenswerte erfasst. Umlaufvermögen: Dies umfasst kurzfristige Vermögenswerte.
                        Passivseite (Kapitalseite): Verbindlichkeiten: Hier werden sowohl kurzfristige als auch langfristige Verbindlichkeiten erfasst. Eigenkapital: Dies umfasst das von den Eigentümern oder Aktionären des Unternehmens eingezahlte Kapital.')
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(12,'Der Eigenkapitalvergleich ist eine Analysemethode, bei der das Eigenkapital eines Unternehmens zu verschiedenen Zeitpunkten verglichen wird, um Veränderungen und Trends in der finanziellen Position des Unternehmens zu erkennen. Er bietet Informationen über die finanzielle Stabilität, Rentabilität und das Wachstumspotenzial eines Unternehmens.
                        Informationen, die der Eigenkapitalvergleich liefern kann:
                        
                        Veränderungen des Eigenkapitals
                        Kapitalstruktur
                        Rentabilität
                        Wachstumspotenzial');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(13,'Eine Erhöhung des Eigenkapitals wird als Eigenkapitalzufluss oder Eigenkapitalerhöhung bezeichnet, während eine Verringerung des Eigenkapitals als Eigenkapitalabfluss oder Eigenkapitalminderung bezeichnet wird. ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(14,'Die Veränderung des Eigenkapitals kann verschiedene Gründe haben, darunter:
                        
                        Gewinne oder Verluste
                        Eigenkapitaleinlagen oder -entnahmen
                        Kapitalerhöhungen oder -minderungen
                        Dividendenausschüttungen');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(15,'Hier sind einige gängige Arten von Bestandskonten:
                        
                        Warenbestandskonto
                        Rohstoffbestandskonto
                        Fertigerzeugniskonto
                        Halbfertigerzeugniskonto
                        Hilfsstoffbestandskonto
                        Materialbestandskonto');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(17,'Zugänge auf Bestandskonten werden in der Regel auf der Soll seite des Kontos erfasst.');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(18,'Abgänge auf Bestandskonten werden in der Regel auf der Haben seite des Kontos erfasst.');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(19,'Bestandskonten werden in der Buchhaltung mit anderen Konten verknüpft, indem sie in Transaktionen und Buchungen miteinander interagieren.
                        Verknüpfung mit dem Kassenkonto
                        Verknüpfung mit dem Verkaufskonto
                        Verknüpfung mit dem Lieferantenkonto
                        Verknüpfung mit dem Herstellungskonto');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(20,'Das Grundbuch ist ein zentrales Buchhaltungsdokument, das zur Erfassung und Aufzeichnung von Geschäftsvorfällen in der doppelten Buchführung verwendet wird.
                        
                        Dokumentation von Geschäftsvorfällen
                        Nachweis von Kontenbewegungen
                        Kontrollinstrument
                        Grundlage für die Erstellung von Abschlüssen
                        Nachweis für Steuer- und rechtliche Zwecke');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(21,'Im Grundbuch werden verschiedene Arten von Konten geführt, die sich je nach ihrer Funktion und ihrem Zweck voneinander unterscheiden.
                        Bestandskonten
                        Erfolgskonten
                        Hilfskonten
                        Privatkonten: Privatkonten werden verwendet, um Transaktionen zwischen dem Unternehmen und seinen Eigentümern oder Gesellschaftern zu erfassen.')
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(22,'Buchungen im Grundbuch werden in Form von Eintragungen vorgenommen, um die verschiedenen Konten zu aktualisieren und die finanziellen Transaktionen eines Unternehmens zu dokumentieren. Die Erfassung von Buchungen im Grundbuch erfolgt in der Regel nach dem sogenannten ""Doppik-Prinzip"" der doppelten Buchführung, bei dem jede Transaktion mindestens zwei Buchungen erfordert - eine Soll-Buchung und eine Haben-Buchung.
                        Bei der Buchung im Grundbuch werden folgende Schritte durchgeführt: Identifizierung der Transaktion, Soll- und Haben-Buchung, Gegenbuchung, Dokumentation
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(23,'Das Grundbuch wird mit anderen Konten in der Buchhaltung durch Buchungen verknüpft. 
                        Die Verknüpfung erfolgt durch das Prinzip der doppelten Buchführung, bei dem jede Transaktion mindestens zwei Buchungen erfordert - eine Soll-Buchung und eine Haben-Buchung
                        Soll an Haben');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(24,'Das Hauptbuch ist ein zentrales Buchhaltungsdokument, in dem alle Geschäftsvorfälle eines Unternehmens systematisch erfasst werden. Es dient als eine Art Kontenübersicht und enthält alle Konten des Unternehmens.
                        Das Hauptbuch hat mehrere wichtige Funktionen:
                        
                        Kontenführung
                        Dokumentation
                        Überwachung
                        Erstellung von Abschlüssen
                        Fehleridentifikation und -korrektur
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(25,'Bei der Erfassung einer Buchung im Hauptbuch werden in der Regel folgende Informationen dokumentiert:
                        
                        Datum
                        Kontonummer
                        Bezeichnung
                        Betrag
                        Die Buchungen werden gemäß dem doppelten Buchführungssystem erfasst, bei dem jeder Buchung sowohl ein Soll- als auch ein Habenbetrag zugeordnet wird. Diese Buchungen stellen den Austausch zwischen den verschiedenen Konten im Hauptbuch dar und halten die Kontostände auf dem aktuellen Stand.
                        
                        Die dokumentierten Journaleinträge im Hauptbuch dienen dazu, alle finanziellen Transaktionen eines Unternehmens zu erfassen und zu verfolgen. 
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(26,'Um mögliche Fehler im Hauptbuch zu identifizieren und zu korrigieren, können folgende Maßnahmen ergriffen werden:
                        
                        Abstimmung der Konten
                        Kontrollrechnungen
                        Überprüfung der Buchungsvorgänge
                        Verwendung von Kontenabstimmungssystemen
                        Interne Kontrollmaßnahmen
                        Die genaue Vorgehensweise zur Korrektur hängt von der Art des Fehlers ab. In der Regel werden falsche Buchungen storniert und durch korrekte Buchungen ersetzt. Es ist wichtig, alle Änderungen und Korrekturen nachvollziehbar zu dokumentieren und die Gründe für die Korrekturen zu protokollieren.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(27,'Eine Eröffnungsbilanz ist eine Bilanz, die am Anfang eines Geschäftsjahres oder beim Start eines neuen Unternehmens erstellt wird. Sie bildet den Ausgangspunkt der Buchhaltung für einen bestimmten Zeitraum und zeigt die finanzielle Situation des Unternehmens zu Beginn dieser Periode.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(28,'Eine Schlussbilanz ist eine Bilanz, die am Ende eines Geschäftsjahres oder eines bestimmten Abrechnungszeitraums erstellt wird. Sie fasst die finanziellen Aktivitäten und Transaktionen des Unternehmens während dieses Zeitraums zusammen und gibt Auskunft über die finanzielle Situation des Unternehmens zum Abschlusszeitpunkt. 
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(29,'Erfolgskonten sind Konten in der Buchhaltung, die verwendet werden, um die Erträge und Aufwendungen eines Unternehmens während eines bestimmten Geschäftszeitraums zu erfassen. Sie dienen dazu, den Gewinn oder Verlust des Unternehmens zu ermitteln und ermöglichen eine detaillierte Analyse der Einnahmen und Ausgaben.
                        Die Rolle der Erfolgskonten besteht darin, die finanziellen Auswirkungen der Geschäftstätigkeit zu verfolgen und zu kategorisieren. Sie ermöglichen es einem Unternehmen, seine Einnahmen, Kosten und Ausgaben auf verschiedene Konten aufzuteilen, um eine bessere Übersicht über die finanzielle Leistung zu erhalten. 
                        Erfolgskonten lassen sich in verschiedene Kategorien unterteilen:
                        Erlöskonten
                        Aufwandskonten
                        Gewinn- und Verlustkonten
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(30,'Erlöskonten: Diese Konten erfassen die Einnahmen oder Erlöse aus dem Verkauf von Waren oder der Erbringung von Dienstleistungen. 
                        Umsatzerlöse: Erfasst den Umsatz aus dem Verkauf von Waren oder Dienstleistungen.
                        Zinserträge: Erfasst Zinseinnahmen aus Anlagen oder Krediten.
                        Provisionseinnahmen: Erfasst Provisionen, die durch den Verkauf von Produkten oder Dienstleistungen erzielt werden.
                        
                        Aufwandskonten: Diese Konten erfassen die Kosten und Ausgaben, die im Rahmen der Geschäftstätigkeit anfallen.
                        Personalkosten: Erfasst Gehälter, Löhne, Sozialabgaben und andere mit dem Personal verbundene Kosten.
                        Materialkosten: Erfasst die Kosten für den Einkauf oder die Herstellung von Materialien.
                        Mietkosten: Erfasst die Kosten für die Anmietung von Räumlichkeiten oder Geräten.
                        Werbekosten: Erfasst die Kosten für Marketing- und Werbeaktivitäten.
                        Abschreibungen: Erfasst den Werteverzehr von Anlagevermögen über deren Nutzungsdauer.
                        Zinskosten: Erfasst die Kosten für aufgenommene Kredite oder andere Finanzierungskosten.
                        
                        Gewinn- und Verlustkonten: Diese Konten werden am Ende des Geschäftsjahres verwendet, um den Gewinn oder Verlust des Unternehmens zu ermitteln.
                        Gewinn: Erfasst den Gesamtgewinn des Unternehmens.
                        Verlust: Erfasst den Gesamtverlust des Unternehmens.');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(31,'Erlöse:
                        Umsatzerlöse
                        Zinserträge
                        Provisionseinnahmen
                        
                        Kosten:
                        Personalkosten
                        Materialkosten
                        Mietkosten
                        Werbekosten
                        Abschreibungen
                        Zinskosten');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(32,'Gewinne und Verluste werden in den Erfolgskonten behandelt und verbucht, um die finanzielle Leistung eines Unternehmens zu erfassen.
                        
                        Gewinne:
                        Gewinn aus dem operativen Geschäft
                        Sonstige Gewinne
                        
                        Verluste:
                        Verluste aus dem operativen Geschäft
                        Sonstige Verluste
                        
                        Die Verbuchung von Gewinnen und Verlusten erfolgt in der Regel am Ende eines Abrechnungszeitraums, z.B. am Ende eines Geschäftsjahres. Dabei werden die Gewinne auf der Habenseite und die Verluste auf der Sollseite des jeweiligen Erfolgskontos verbucht.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(33,'Erfolgskonten haben eine direkte Auswirkung auf die Gewinn- und Verlustrechnung (GuV) eines Unternehmens. Die GuV ist eine wichtige Finanzdokumentation, die die Erträge (Einnahmen) und Aufwendungen (Kosten) eines Unternehmens für einen bestimmten Zeitraum, normalerweise ein Geschäftsjahr, darstellt.
                        Umsatzerlöse:Ein höherer Umsatz führt zu höheren Erträgen und einem potenziell höheren Gewinn.
                        Aufwandskonten:Ein höherer Aufwand führt zu niedrigeren Erträgen und potenziell zu einem niedrigeren Gewinn oder sogar zu einem Verlust.
                        Gewinn- und Verlustkonto:Der Saldo des Gewinn- und Verlustkontos beeinflusst direkt den Gewinn oder Verlust, der in der GuV ausgewiesen wird.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(34,'Das Gewinn- und Verlustkonto (auch GuV-Konto oder Ertragskonto genannt) ist ein zentrales Konto in der Buchhaltung eines Unternehmens. Es dient dazu, alle Erträge (Einnahmen) und Aufwendungen (Kosten) eines Unternehmens für einen bestimmten Zeitraum zu erfassen, normalerweise ein Geschäftsjahr. Das Gewinn- und Verlustkonto hat folgende Funktionen:
                        Erfassung von Erträgen
                        Erfassung von Aufwendungen
                        Ermittlung des Gewinns oder Verlusts
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(35,'Einnahmen:
                        Umsatzerlöse
                        Zinserträge
                        Dividendenerträge
                        Mieteinnahmen
                        Provisionen
                        
                        Ausgaben:
                        Personalkosten
                        Materialkosten
                        Miet- und Leasingkosten
                        Marketing- und Werbekosten
                        Zinsaufwendungen
                        Steuern
                        Abschreibungen
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(36,'Die Grundformel für die Gewinn- und Verlustrechnung lautet:
                        Gewinn/Verlust = Einnahmen - Ausgaben
                        
                        Grundlegenden Schritte, um den Gewinn oder Verlust zu ermitteln:
                        Einnahmen summieren
                        Ausgaben summieren
                        Gewinn oder Verlust ermitteln
                        Durch Subtraktion der Gesamtausgaben von den Gesamteinnahmen wird der Gewinn oder Verlust berechnet. Wenn die Einnahmen die Ausgaben übersteigen, ergibt sich ein Gewinn. Wenn die Ausgaben die Einnahmen übersteigen, entsteht ein Verlust.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(37,'Gewinn oder Verlust
                        Umsatzerlöse
                        Kosten und Ausgaben
                        Bruttogewinn
                        Betriebsergebnis
                        Steuern und Nettoergebnis');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(38,'Abschreibungen sind in der Buchhaltung wichtige bilanzielle Maßnahmen, bei denen der Wertverlust von Vermögensgegenständen über deren Nutzungsdauer hinweg erfasst wird
                        Warum Abschreibungen in der Buchhaltung wichtig sind:
                        
                        Bilanzielle Genauigkeit
                        Zeitgerechte Kostenzuordnung
                        Gewinnermittlung
                        Steuerliche Auswirkungen
                        Investitionsentscheidungen
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(39,'Lineare Abschreibung: Bei der linearen Abschreibung wird der Wertverlust eines Vermögensgegenstands gleichmäßig über seine Nutzungsdauer verteilt.
                        Degressive Abschreibung: Die degressive Abschreibung erlaubt eine höhere Abschreibung zu Beginn der Nutzungsdauer und eine allmähliche Reduzierung in den folgenden Jahren.
                        Leistungsabhängige Abschreibung: Bei der leistungsabhängigen Abschreibung wird der Wertverlust eines Vermögensgegenstands basierend auf seiner tatsächlichen Nutzung oder Produktionsleistung erfasst.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(40,'In der Gewinn- und Verlustrechnung werden Abschreibungen als Aufwand erfasst. Sie mindern den Gewinn eines Unternehmens, da sie den Wertverlust von Vermögensgegenständen über deren Nutzungsdauer hinweg abbilden.
                        In der Bilanz wirken sich Abschreibungen auf die Vermögenswerte aus. Der Buchwert eines Vermögensgegenstands wird um den Betrag der Abschreibung reduziert. Dadurch spiegelt die Bilanz den tatsächlichen Wert des Vermögensgegenstands zum jeweiligen Zeitpunkt wider.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(41,'Wahl der Abschreibungsmethode
                        Nutzung von Sonderabschreibungen
                        Identifikation von steuerlich begünstigten Vermögensgegenständen
                        Timing von Investitionen
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(42,'Standardsteuersatz: Der Standardsteuersatz ist der allgemeine Steuersatz, der auf die meisten Waren und Dienstleistungen erhoben wird. Er variiert von Land zu Land und kann beispielsweise 19%, 20% oder 21% betragen.
                        Reduzierter Steuersatz: Ein reduzierter Steuersatz wird oft auf bestimmte Waren und Dienstleistungen angewendet, die als essentiell oder von öffentlichem Interesse angesehen werden. Dies können beispielsweise Lebensmittel, Bücher, Medikamente oder öffentlicher Nahverkehr sein. Der reduzierte Steuersatz ist in der Regel niedriger als der Standardsteuersatz.
                        Nullsteuersatz: Einige Länder erheben einen Nullsteuersatz auf bestimmte Waren und Dienstleistungen. Dies bedeutet, dass für diese Produkte keine Umsatzsteuer berechnet wird. Beispiele für Produkte, die unter den Nullsteuersatz fallen können, sind Exportgüter oder bestimmte Finanzdienstleistungen.
                        Sondersteuersätze: In einigen Fällen können spezielle Steuersätze für bestimmte Branchen oder Produkte gelten. Zum Beispiel können Tabakprodukte, Alkohol, Treibstoffe oder Luxusgüter höhere Steuersätze haben.
                        
                        Die Anwendung der Umsatzsteuersätze erfolgt durch den Verkäufer oder Dienstleister, der die Umsatzsteuer im Verkaufspreis oder in der Rechnung an den Kunden berechnet. Der Verkäufer ist verpflichtet, die eingenommene Umsatzsteuer an die zuständige Steuerbehörde abzuführen. Der Kunde, der die Produkte oder Dienstleistungen erwirbt, zahlt den entsprechenden Steuerbetrag als Teil des Kaufpreises.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(43,'Die Vorsteuer ist der Betrag an Umsatzsteuer, den ein Unternehmen für Einkäufe und Geschäftsausgaben gezahlt hat. Es handelt sich um die Umsatzsteuer, die auf den Einkaufspreis von Waren oder Dienstleistungen erhoben wurde. Die Vorsteuer kann vom Unternehmen als Vorabzahlung auf die Umsatzsteuerschuld verrechnet werden, die es von seinen Kunden erhält.
                        Die Berechnung des Umsatzsteuerbetrags, den ein Unternehmen an das Finanzamt abführen muss, erfolgt in der Regel durch die Differenz zwischen der Umsatzsteuer, die es von seinen Kunden eingenommen hat, und der Vorsteuer, die es für seine eigenen Einkäufe gezahlt hat. Wenn die Vorsteuer den Betrag der eingenommenen Umsatzsteuer übersteigt, ergibt sich ein Überschuss, der dem Unternehmen erstattet wird.
                        ');
                        INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(44,'Liquiditätsanalyse: Die Analyse der Umsatzsteuerzahlungen und Vorsteuerrückerstattungen kann Aufschluss über die Liquiditätssituation eines Unternehmens geben. Wenn ein Unternehmen regelmäßig hohe Umsatzsteuerzahlungen leistet, kann dies seine Liquidität beeinflussen.
                        Steuerplanung: Durch eine effektive Nutzung von Vorsteuerrückerstattungen kann ein Unternehmen seine Steuerbelastung reduzieren und seine finanzielle Leistung verbessern.
                        Kostenanalyse: Die Analyse der Vorsteuer kann Aufschluss über die Kostenstruktur eines Unternehmens geben.
                        Compliance und Risikomanagement: Dies hilft, finanzielle Risiken wie Strafen und Zinsen zu vermeiden.
                        ');
                    ");

                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }

        private void ExecuteScript(SqlConnection connection, string script)
        {
            using (var command = new SqlCommand(script, connection))
            {
                command.ExecuteNonQuery();
            }
        }

        private void InsertContent(SqlConnection connection, string contentScript)
        {
            using (var command = new SqlCommand(contentScript, connection))
            {
                command.ExecuteNonQuery();
            }
        }
    }
}
