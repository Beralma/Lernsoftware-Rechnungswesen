USE master;
GO

IF DB_ID(N'hausarbeit_DE') IS NULL
  CREATE DATABASE hausarbeit_DE;
GO

USE hausarbeit_DE;
GO 

DROP TABLE IF EXISTS Rueckmeldung;
DROP TABLE IF EXISTS Aufgabenstellung;
DROP TABLE IF EXISTS Inhalt;
DROP TABLE IF EXISTS Kapitel;


CREATE TABLE Kapitel (
  Kapitel_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Kapitel_Name nvarchar(100) not null,
);

CREATE TABLE Inhalt (
  Inhalt_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Kapitel_id int not null,
  Inhalt_Text ntext not null,
  constraint fk_KapitelInhalt foreign key (Kapitel_id) references Kapitel(Kapitel_id)
);

CREATE TABLE Aufgabenstellung (
  AGS_id INT IDENTITY (1, 1) PRIMARY KEY, 
  --Kapitel_id int not null,
  Inhalt_id int not null,
  AGS_Text ntext not null,
 -- CONSTRAINT fk_KapitelAufgabenstellung FOREIGN KEY (Kapitel_id) REFERENCES Kapitel(Kapitel_id),
	CONSTRAINT fk_InhaltAufgabenstellung FOREIGN KEY (Inhalt_id) REFERENCES Inhalt(Inhalt_id)
);

CREATE TABLE Rueckmeldung (
  Rueck_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Rueck_Text ntext not null,
  AGS_id int foreign key references Aufgabenstellung(AGS_id)

);

Insert into Kapitel(Kapitel_Name) VALUES('Inventur > Inventar > Bilanz')
Insert into Kapitel(Kapitel_Name) VALUES('Eigenkapitalvergleich')
Insert into Kapitel(Kapitel_Name) VALUES('Bestandskonten')
Insert into Kapitel(Kapitel_Name) VALUES('Grundbuch')
Insert into Kapitel(Kapitel_Name) VALUES('Hauptbuch')
Insert into Kapitel(Kapitel_Name) VALUES('Er�ffnungs-/Schlussbilanz konto')
Insert into Kapitel(Kapitel_Name) VALUES('Erfolgskonten')
Insert into Kapitel(Kapitel_Name) VALUES('Gewinn und Verlust konto')
Insert into Kapitel(Kapitel_Name) VALUES('Lineare Abschreibung')
Insert into Kapitel(Kapitel_Name) VALUES('Umsatzsteuer')


INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'
Inventur ist ein Prozess, bei dem die Best�nde und Werte von Waren, Materialien oder Verm�genswerten eines Unternehmens erfasst und �berpr�ft werden.
Dies geschieht in der Regel am Ende eines Gesch�ftsjahres, um eine genaue Bestandsaufnahme zu erstellen.

W�hrend der Inventur werden alle vorhandenen Best�nde physisch gez�hlt, �berpr�ft und mit den Aufzeichnungen im Lagerbestandssystem abgeglichen.
Ziel ist es, m�gliche Abweichungen zwischen den tats�chlichen Best�nden und den erwarteten Best�nden zu identifizieren und zu korrigieren.

Die Inventur erm�glicht es einem Unternehmen, die Genauigkeit seiner Bestandsaufzeichnungen zu �berpr�fen,
potenzielle Verluste oder Diebst�hle aufzudecken und eine Grundlage f�r die finanzielle Bewertung des Unternehmens zu schaffen.
')

INSERT INTO Inhalt(Kapitel_id,Inhalt_Text) VALUES (1,'
Es gibt verschiedene Arten der Inventur, die je nach den Bed�rfnissen und Anforderungen eines Unternehmens oder einer Organisation eingesetzt werden k�nnen.
Hier sind einige der g�ngigen Arten der Inventur:

Stichtagsinventur: Bei dieser Art der Inventur wird der Bestand an einem bestimmten Stichtag physisch gez�hlt.
Alle physischen Best�nde werden erfasst, und Abweichungen zwischen den erwarteten und den tats�chlichen Best�nden werden ermittelt.

Permanente Inventur: Bei der permanenten Inventur wird der Bestand laufend und regelm��ig �ber das gesamte Jahr hinweg erfasst und aktualisiert.
Dies kann beispielsweise durch den Einsatz von Barcodescannern oder automatisierten Inventursystemen geschehen.

Stichprobeninventur: Bei dieser Art der Inventur werden nur ausgew�hlte Best�nde oder Teilmengen des Gesamtbestands �berpr�ft.
Statt den gesamten Bestand zu z�hlen, werden repr�sentative Stichproben genommen und die Ergebnisse auf den Gesamtbestand hochgerechnet.

Wertm��ige Inventur: Bei der wertm��igen Inventur wird der Bestand nicht physisch gez�hlt, sondern es werden lediglich die finanziellen Werte der Best�nde ermittelt.
Dies geschieht anhand von Buchhaltungsaufzeichnungen, die den Bestand und den Wert der Artikel enthalten.

Verlegte Inventur: Bei der verlegten Inventur wird der physische Bestand nicht am eigentlichen Lagerort gez�hlt, sondern an einem anderen Ort, beispielsweise in einem externen Lager oder bei einem Lieferanten.
Diese Art der Inventur wird oft verwendet, um den Gesch�ftsbetrieb nicht zu st�ren oder um genaue Bestandsdaten zu erhalten, wenn der normale Betrieb nicht m�glich ist.

Digitale Inventur: Bei der digitalen Inventur wird der Bestand mithilfe von Technologie und automatisierten Systemen erfasst.
Dies kann beispielsweise durch den Einsatz von Barcodescannern, RFID-Tags oder Inventursoftware geschehen. Die digitale Inventur erm�glicht eine schnellere und genauere Erfassung der Best�nde.

Jede Art der Inventur hat ihre Vor- und Nachteile, und die Auswahl h�ngt von verschiedenen Faktoren wie der Gr��e des Bestands,
der Art der Artikel, der verf�gbaren Ressourcen und den spezifischen Anforderungen des Unternehmens ab.
Oft wird eine Kombination aus verschiedenen Inventurmethoden eingesetzt, um ein genaues und effizientes Bestandsmanagement sicherzustellen.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'
Das Inventar ist eine Aufstellung aller Verm�gensgegenst�nde, Schulden und Eigenkapital eines Unternehmens zu einem bestimmten Zeitpunkt.
Es gibt einen �berblick �ber die finanzielle Situation des Unternehmens und dient als Grundlage f�r die Buchf�hrung und die Erstellung von Finanzabschl�ssen.
Das Inventar umfasst sowohl materielle Verm�genswerte wie Bargeld, Lagerbest�nde und Ausr�stung als auch immaterielle Verm�genswerte wie Patente und Marken.
Auf der Passivseite werden die Verbindlichkeiten des Unternehmens, wie Darlehen oder Lieferantenschulden, sowie das Eigenkapital aufgef�hrt.
Das Inventar wird normalerweise am Ende eines Gesch�ftsjahres oder zu anderen festgelegten Zeitpunkten erstellt, um eine genaue Bestandsaufnahme zu erm�glichen.
Es dient als Grundlage f�r die Bewertung des Unternehmens und die Berechnung von Kennzahlen wie dem Working Capital oder dem Nettoverm�gen.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'
Eine Bilanz ist eine finanzielle Zusammenfassung, die die Verm�genswerte, Schulden und das Eigenkapital eines Unternehmens zu einem bestimmten Zeitpunkt darstellt.
Sie gibt einen �berblick �ber die finanzielle Lage und den Wert eines Unternehmens.
Die Bilanz besteht aus zwei Hauptteilen: der Aktivseite und der Passivseite.
Auf der Aktivseite werden die Verm�genswerte des Unternehmens aufgef�hrt, wie zum Beispiel Bargeld, Forderungen, Vorr�te, Immobilien und Investitionen. Diese zeigen, was das Unternehmen besitzt und welchen Wert es hat.
Auf der Passivseite werden die Schulden und das Eigenkapital des Unternehmens aufgef�hrt. Schulden k�nnen Verbindlichkeiten gegen�ber Lieferanten, Darlehen oder andere Verpflichtungen sein.
Das Eigenkapital repr�sentiert den Anteil der Eigent�mer am Unternehmen.
Die Bilanzgleichung besagt, dass die Summe der Aktivseite gleich der Summe der Passivseite sein muss. Dies bedeutet, dass das Verm�gen eines Unternehmens durch Schulden und Eigenkapital finanziert wird.
Die Bilanz ist ein wichtiges Instrument f�r Unternehmen, Investoren, Gl�ubiger und andere Stakeholder, um die finanzielle Gesundheit und Stabilit�t eines Unternehmens zu beurteilen.
Sie liefert Informationen �ber die Liquidit�t, die Verschuldung und den Wert eines Unternehmens und dient als Grundlage f�r finanzielle Entscheidungen und Analysen.')
---------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(2,'
Der Eigenkapitalvergleich ist eine einfache und effektive Methode, um den Erfolg eines Unternehmens zu bewerten.
Es wird ein Vergleich zwischen dem Betrag am Anfang der Periode und dem Betrag am Ende der Periode durchgef�hrt.
Wenn das Eigenkapital steigt, wird dies als Eigenkapitalmehrung bezeichnet, wenn es sinkt Eigenkapitalminderung.
Es ist nicht erlaubt, private Einnahmen oder Entnahmen als Erh�hung oder Abnahme zu betrachten.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(2,'
Die Berechnung der Verm�gensver�nderung als Vergleich des Betriebsverm�gens ist eine bedeutende Komponente bei der Steuerfestsetzung.
Gewerbetreibende, die f�r die Buchhaltung verantwortlich sind, m�ssen einen umfassenden �berblick �ber das Betriebsverm�gen haben.
Es ist ausreichend, einen vereinfachten und nicht vollst�ndigen Vergleich des Betriebsverm�gens bei Selbstst�ndigen durchzuf�hren, die freiwillig B�cher f�hren.')
----------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
Die Bestandskonten werden durch die doppelte Buchf�hrung aus der Bilanz des Unternehmens abgeleitet.
Jeder Posten in der Bilanz muss ein eigenes Bestandskonto gef�hrt werden.
Die Konten werden als Aktiv- oder Passivkonten bezeichnet, je nachdem, aus welcher Seite der Bilanz (Aktiva oder Passiva) sie stammen.
Die Werte des Anlage- und Umlaufverm�gens werden auf den aktiven Bestandskonten angezeigt, w�hrend die Kapitalquellen auf den passiven Bestandskonten angezeigt werden.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
Aktivkonten wie Geb�ude, Maschinen und Fuhrpark haben Auswirkungen auf das Anlage- und Umlaufverm�gen eines Unternehmens und stehen auf der Habenseite einer Bilanz als Bestandskonten.
Unternehmen buchen Betr�ge auf der Sollseite der Bestandskonten ein, wenn sie auf den Bestandskonten eingehen.
Unternehmen k�nnen den Fuhrpark erweitern, indem sie die Aktiv- oder Sollseite des Bestandskontos erreichen, w�hrend ein Verkauf die Passiv- oder Habenseite des Kontos betrifft.
Eine kurze Zusammenfassung zeigt die Idee: Die Sollseite von Aktivkonten ist f�r die Buchung von Zug�ngen zust�ndig, w�hrend die Habenseite f�r Abg�nge zust�ndig ist.
Der Startbestand eines Aktivkontos liegt auf der Aktivseite, w�hrend der Endbestand auf der Passivseite liegt.
Passivkonten auf der Passivseite der Bilanz sind Konten wie Bankverbindlichkeiten oder Spareinlagen, die das Eigenkapital eines Unternehmens betreffen.
Unternehmen buchen auf passiven Bestandskonten im Gegensatz zum Aktivkonto einen Zugang auf der Passiv- oder Habenseite, w�hrend sie einen Abgang auf der Aktiv- oder Sollseite ausweisen.
Bei passiven Bestandskonten sind der Anfangs- und Endbestand auf der Passivseite zu finden, w�hrend bei aktiven Bestandskonten der Endbestand auf der Aktivseite zu erkennen ist.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
Ein Beispiel zeigt die Buchung auf einem Bestandskonto:
Ein Unternehmen kauft ein Auto f�r 15.000 Euro und �berweist den Preis per �berweisung vom Bankkonto.
Bei der doppelten Buchf�hrung muss jede Buchung auf einem Bestandskonto im Soll mit einer entsprechenden Buchung im Haben �bereinstimmen, was zu zwei Konten f�hrt.
Durch die Anschaffung steigt der Bestand auf der Aktivseite des Bestandskontos Fuhrpark um 15.000 Euro, w�hrend sich das Bankguthaben auf der Aktivseite des Bestandskontos um 15.000 Euro verringert.
Sobald eine Buchung auf einem Bestandskonto im Soll durchgef�hrt wird, wird eine entsprechende Habenbuchung auf einem anderen Konto durchgef�hrt.
Es ist erforderlich, bei jeder Buchung das passende Gegenkonto anzugeben.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'
Im Rahmen der Inventur zum Ende des Gesch�ftsjahres sind Unternehmen gem�� den Bestimmungen des Handelsgesetzbuchs verpflichtet, die Schlussbest�nde der Bestandskonten zu ermitteln, um sie in der Bilanz auszuweisen.
Da sich der Schlussbestand aus der Differenz zwischen Soll- und Habenseite ergibt, wird dieser Prozess auch als Saldieren bezeichnet.
Die Differenz zwischen Soll- und Habenseite bildet den Schlussbestand der Aktivkonten, w�hrend der Endsaldo der Passivkonten aus der Differenz zwischen Haben- und Sollseite entsteht.
Es ist von Bedeutung, im Voraus Unterschiede in der Best�nde zu vermeiden.')
------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'
Das Grundbuch, auch bekannt als Journal, listet alle Ereignisse im Unternehmen in einer geordneten Reihenfolge auf.
Die Grundlage daf�r sind Dokumente wie Rechnungen oder Quittungen.
Die chronologische Auflistung soll dazu beitragen, dass die Beh�rden leichter daran arbeiten k�nnen, eventuelle Untersuchungen durchzuf�hren.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'
Vor der Digitalisierung bestand die Buchhaltung tats�chlich aus mehreren physischen B�chern.
Dieser Aspekt der elektronischen Buchf�hrung ist etwas vernachl�ssigt worden, jedoch werden auch die verschiedenen B�cher immer noch durch zeitgem��e Software-L�sungen behandelt.
Dies umfasst vor allem das Grundbuch, das Hauptbuch und zahlreiche Nebenb�cher.

Das Ziel des Grundbuchs besteht darin, alle Ereignisse im Gesch�ftsleben in chronologischer Reihenfolge aufzulisten.
Au�erdem sind Er�ffnungs-, laufende-, vorbereitende- und Abschlussbuchungen enthalten.
Die Idee, dass Unternehmen ihre Gesch�ftsvorf�lle chronologisch organisieren, macht es den Beh�rden deutlich einfacher, �berpr�fungen durchzuf�hren.
Normalerweise m�ssen die Merkmale eines Unternehmensvorfalls im Grundbuch festgehalten werden:

Datum
Nummer des Belegs
Habenkonto
Sollkonto
Betrag
Buchungstext')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'
Um das Grundbuch �berhaupt zu erstellen, ist es notwendig, Belege f�r alle Gesch�ftsvorf�lle aufzubewahren.
Es kann beispielsweise um Kundenrechnungen, Kontoausz�ge oder Kassenbelege gehen.
Es ist von entscheidender Bedeutung, dass jeder im Grundbuch aufgef�hrte Gesch�ftsvorfall durch einen ausreichenden Nachweis nachgewiesen werden kann.
Falls es keine Rechnung oder Quittung zu einer aufgef�hrten Belegnummer gibt, wird der Eintrag vom Finanzamt nicht akzeptiert.
Die einzelnen Gesch�ftsvorf�lle werden dann aus dem Grundbuch in das Hauptbuch �bertragen.
Wie der Name vermuten l�sst, dient das Grundbuch als Basis f�r die Buchhaltung.
Die Gesch�ftstransaktionen werden im Hauptbuch einzelnen Sachkonten � Bestands- und Erfolgskonten � zugeordnet.
Es ist von Bedeutung f�r den Gesetzgeber, da die einzelnen Ereignisse nicht nur chronologisch, sondern auch sachlich geordnet werden m�ssen.
Letztendlich besteht das Hauptbuch aus den Sachkonten, die im Kontenplan aufgef�hrt sind.')
-------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(5,'
Die Buchf�hrung besteht aus dem Hauptbuch.
Das Hauptbuch �bertr�gt gesch�ftliche Ereignisse aus dem Grundbuch, um eine angemessene Ordnung aller Buchungen auf Sachkonten zu schaffen.

Die doppelte Buchf�hrung umfasst das Hauptbuch, in das alle gesch�ftlichen Ereignisse sorgf�ltig und angemessen dokumentiert werden.
Grund daf�r ist das Journal, welches alle Ereignisse im Gesch�ft immer noch chronologisch geordnet hat.
Damit das Hauptbuch als Grundlage der Bilanz dienen kann, muss es das Prinzip der Geschlossenheit befolgen.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(5,'
Das Hauptbuch besteht aus Sachkonten, die bestimmte Gesch�ftsvorf�lle nach ihrer Ursache ordnen.
Grund daf�r ist das Journal, in das alle Ereignisse in ihrer chronologischen Reihenfolge dokumentiert werden.
Es gibt drei verschiedene M�glichkeiten, die �bertragung durchzuf�hren:

F�hrung und Abschluss des Hauptbuchs
Normalerweise wird das Hauptbuch gem�� den Vorlagen des Industriekontenrahmens, des Standardkontenrahmens oder des Gemeinschaftskontenrahmens aufgebaut.
Die Bilanz entsteht automatisch, nachdem alle Sachkonten und das Hauptbuch geschlossen wurden.
Mit dem Abschluss des Hauptbuchs wird auch die Gewinn- und Verlustrechnung direkt erstellt.

Daher sieht der Gesetzgeber vor, dass das Prinzip der Geschlossenheit im Hauptbuch ber�cksichtigt wird.
Das bedeutet offiziell, dass es zu einem Ausgleich zwischen dem Soll- und dem Haben kommt.
Es ist erforderlich, dass die Summe aller Sollposten exakt der Summe aller Habenposten entspricht.
Es ist auch wichtig, dass es auch materielle Geschlossenheit gibt, was bedeutet, dass das Hauptbuch tats�chlich alle gesch�ftlichen Ereignisse einer bestimmten Zeitspanne dokumentiert.
')
-------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(6,'
Die Schlussbilanz ist eine Zusammenfassung der finanziellen Situation eines Unternehmens zu einem bestimmten Zeitpunkt, in der alle Verm�genswerte, Schulden und das Eigenkapital aufgef�hrt werden.
Sie wird auch als Abschlussbilanz, Schlussrechnung oder Schlusskonto bezeichnet.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(6,'
Die Er�ffnungsbilanz ist eine Bilanz, die zu Beginn eines neuen Gesch�ftsjahres oder bei Gr�ndung eines Unternehmens erstellt wird.
Sie dient als Ausgangspunkt f�r die Buchf�hrung und gibt einen �berblick �ber die finanzielle Situation des Unternehmens zu diesem Zeitpunkt.')
--------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
Es gibt viele verschiedene Begriffe im Bereich der Finanzen und Buchhaltung. Schnell kann dies zu Verwirrung f�hren.
Es ist von entscheidender Bedeutung, die exakte Bedeutung eines Begriffes zu verstehen und seine Anwendung zu verstehen.
Es ist m�glich, dass Sie in der Rechnungslegung bereits von dem Begriff des Erfolgskontos geh�rt haben.
Was ist das genau, und was m�ssen Sie beachten, wenn Sie ein Erfolgskonto buchen? ')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
Erfolgskonten sind ein Unterkonto des Eigenkapitalkontos und sind ein Teil der doppelten Buchf�hrung.
Das Eigenkapitalkonto ist ein Konto, das als passiv betrachtet wird.

Die Erfassung von Gewinnen und Verlusten am Ende des Jahres wird durch die doppelte Buchf�hrung durchgef�hrt.
Neben Kleinunternehmen und Selbstst�ndigen sind alle Unternehmen verpflichtet, eine doppelte Buchf�hrung durchzuf�hren.
Gem�� dem Handelsgesetzbuch werden Kleinunternehmen definiert, wenn ihr Umsatz im letzten Jahr unter 17.500� lag und der Umsatz f�r das kommende Gesch�ftsjahr nicht h�her als 60.000� erwartet wird.

Bestandskonten und Erfolgskonten sind die zwei Hauptkategorien der doppelten Buchf�hrung.
Erfolgskonten verbuchen Ertr�ge und Aufwendungen, w�hrend Bestandskonten das Verm�gen eines Unternehmens wie beispielsweise Grundst�cke und Schulden beschreiben.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
Nun gehen wir noch einmal detaillierter auf die Unterschiede zwischen den beiden Konten ein:
Wie kann man ermitteln, welcher Gesch�ftsvorfall auf welches Konto registriert wird?

Die Bestandskonten werden f�r alle Ereignisse gebucht, die den Bestand eines Unternehmens ver�ndern.
Dies kann beispielsweise die Anschaffung von Ger�ten oder die Zahlung einer Rechnung per Bank�berweisung beinhalten.
Daher werden auf Bestandskonten erfolgsneutrale Gesch�ftsvorf�lle verbucht, was bedeutet, dass alle Vorf�lle, die keinen Einfluss auf den Gewinn des Unternehmens haben, auf Bestandskonten verbucht werden.

Im Gegensatz dazu werden gesch�ftliche Ereignisse auf Erfolgskonten gemeldet, die keinen Einfluss auf den Bestand haben und erfolgreich sind.
Der Gewinn eines Unternehmens wird durch erfolgreiche Vorg�nge beeinflusst.

Ein weiterer bedeutender Unterschied besteht darin, dass die Gewinn- oder Verlustrechnung jedes Jahr mit dem Endbestand des vorherigen Gesch�ftsjahres fortgesetzt wird, w�hrend die Gewinn- oder Verlustrechnung jedes Jahr erfolgt und daher von 0 anf�ngt.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
Wir unterscheiden das Ertrags- und das Aufwandskonto bei den Erfolgskonten.
Alle positiven Wertver�nderungen werden auf Ertragskonten verbucht, w�hrend alle negativen Wertver�nderungen auf Aufwandskonten verbucht werden.
Daher erh�hen Ertr�ge das Eigenkapital, w�hrend Aufwendungen es verringern.
Mieteinnahmen sind ein Beispiel f�r Buchungen auf dem Ertragskonto, w�hrend der Verbrauch von Rohstoffen auf dem Aufwandskonto verbucht wird.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
In der doppelten Buchf�hrung wird jeder Gesch�ftsvorfall auf einem einzelnen Konto und einem anderen Konto verbucht.
Man kann auch die W�rter "M�ssen" und "Besitzen" verwenden.
F�r eine sorgf�ltige und korrekte Buchf�hrung ist es entscheidend, die Begriffe zu definieren und sorgf�ltig zu verstehen.

Die Verm�gensverwendung und -herkunft werden von Soll beschrieben.
Aufgrund der Tatsache, dass die Erfolgskonten als passive Konten gelten, werden alle Gewinne im Besitz und alle Ausgaben im Plan gebucht.
Immer steht Soll auf der linken Seite und Haben auf der rechten.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
Die Salden der beiden Konten m�ssen zuerst gebildet werden. Alle Sollsalden im Aufwandskonto werden addiert, um den Saldo zu erhalten.
Alle Habensalden werden im Ertragskonto addiert, um den Saldo zu erhalten.
Wir beziehen uns hier auf die Buchungss�tze �Ertragskonten an GuV-Konto� und �GuV-Konten an Aufwandskonten�.

Anschlie�end erstellen wir den Saldo des GuV-Kontos und �bernehmen ihn in das Eigenkapitalkonto.
Der Saldo des GuV-Kontos zeigt an, ob das Unternehmen einen Gewinn oder einen Verlust erzielt hat.
Im Fachbereich wird auch der Begriff Jahres�berschuss oder Jahresfehlbetrag verwendet.')
--------------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
Es besteht die M�glichkeit, dass der Aufbau und die Struktur der GuV variieren.
Es besteht die Option, die GuV in Kontenform oder in gestaffelter Form zu erstellen.
Es gibt eine Unterscheidung zwischen der Soll- und Habenseite (Ausgaben/Ertr�ge) im Kontenformat.
Falls ein Saldo auf der Soll-Seite entsteht, wird ein Gewinn erzielt.
Wenn jedoch ein positives Ergebnis auf der finanziellen Seite auftritt, liegt ein Verlust vor. 
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
Die Gewinn- und Verlustrechnung vergleicht alle Kosten und Ertr�ge f�r einen bestimmten Zeitraum.
Dies kann ein Quartal oder das gesamte Gesch�ftsjahr sein. Da es sich um ein Konto auf der Passivseite der Bilanz handelt, werden die Ertr�ge im Saldo gebucht und die Aufwendungen im Soll.
Am Ende des bestimmten Zeitraums wird der Gewinn oder Verlust aus der GuV berechnet und dann auf das Konto Eigenkapital �bertragen.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
Die GuV stellt keine eindeutige Erfolgsspaltung im betriebswirtschaftlichen Sinn dar,
da es nicht erforderlich ist, die Aufwendungen und Ertr�ge in betriebsfremde und betriebliche sowie in einmalige und regelm��ige periodeneigene und periodenfremde Kategorien zu unterteilen.

Es ist notwendig, nicht nur die Daten des letzten Gesch�ftsjahres gem�� HGB und IFRS (Internationale Rechnungslegungsstandards)
zu pr�sentieren, sondern auch die Werte des Vorjahres und sogar die Werte der letzten drei Jahre gem�� US-GAAP.
Falls eine Stelle im aktuellen Jahr nicht besetzt wird, wird sie als unbesetzt aufgef�hrt.
Es ist von gro�er Bedeutung, dass die Betr�ge vergleichbar sind.
Falls dies nicht der Fall ist, muss eine Erkl�rung im Anhang enthalten sein.')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
Eine Abschreibung ist die Abnutzung eines Verm�gensgegenstandes im Rechnungswesen, also der "Werteverzehr".
Die Kosten f�r die Anschaffung und Herstellung dieser Gegenst�nde werden bei einer Abschreibung auf die Jahre der Nutzung des Anlageverm�gens verteilt.
Folglich wird der Gewinn von einer Abschreibung durch den Aufwand verringert, wie es im HGB festgelegt ist. ')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
Jeden Gesch�ftsjahr muss der Kaufmann gem�� � 242 HGB eine Aufstellung seiner Aufwendungen und Ertr�ge vorlegen.
Wenn es um den formalen Aufbau geht, enthalten die internationalen Rechnungslegungsstandards wie die International Financial Reporting Standards (IFRS)
und die United States Generally Accepted Accounting Principles (US-GAAP) detaillierte Regeln.

Viele Unternehmen erstellen monatlich eine GuV und eine vollst�ndige Bilanz, und das bereits wenige Tage nach Ultimo (lestzter tag des Monats).
Dies erm�glicht dem Unternehmer, einen aktuellen Einblick in die Entwicklung seines Gesch�ftsjahres zu erhalten.
Es ist m�glich, Unerwartungen am Ende des Gesch�ftsjahres zu vermeiden und Fehler fr�hzeitig zu verhindern.
Au�erdem besteht die M�glichkeit, dass die besonderen Ereignisse, die f�r die Finanzen relevant sind,
angemessen auf die einzelnen Monate aufgeteilt werden k�nnen, wie z. B. umfangreiche Reparaturen, Forderungsausf�lle oder Betriebsferien.
')
-------------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
Ein Unternehmer muss Umsatzsteuer auf seine Einnahmen zahlen. Im t�glichen Leben ist sie besser bekannt als die Mehrwertsteuer,
obwohl die Bezeichnung ungenau ist. Die Vorsteuer ist die gleiche Steuer aus der Perspektive des K�ufers. ')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
Unternehmer zahlen auf Ums�tze Steuern
Muss auf Kassenbons & Rechnungen explizit ausgewiesen werden
In Deutschland: 19 % oder 7 %
Steuer muss vom Unternehmen an das Finanzamt abgef�hrt werden
Umsatzsteuer = Verbindlichkeit gegen�ber dem Finanzamt')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
Die gleiche Steuer wie die Umsatzsteuer
Aus einer anderen Perspektive
Steuer, die ein Unternehmer zahlt, wenn er Waren oder Dienstleistungen von einem anderen Unternehmer einkauft
Umsatzsteuer des verkaufenden Unternehmens = Vorsteuer des kaufenden Unternehmens
K�ufer, der die Vorsteuer zahlen muss, kann diese wieder vom Finanzamt zur�ckfordern
Vorsteuer = Forderung gegen�ber dem Finanzamt')
-----------------------------------------------------------------------------------------
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
In einem Unternehmen haben die meisten Anlageg�ter nur eine begrenzte Lebensdauer.
Dies gilt auch f�r sehr wertvolle Wirtschaftsg�ter, die mit hohen Anschaffungskosten oder Herstellungskosten verbunden sind.
Laut dem Abschreibungsprinzip ist es erlaubt, dass nur ein Teil der Kosten f�r die Anschaffung eines Verm�genswertes j�hrlich von der Steuer abgesetzt oder in einer Gewinn- und Verlustrechnung und im Jahresabschluss eines Unternehmens vermerkt wird.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Abschreibungen gem�� EStG
Abschreibungen sind gesetzlich erforderlich. Gem�� EStG (Einkommensteuergesetz) m�ssen die Anschaffungskosten und Herstellungskosten bei Wirtschaftsg�tern,
die f�r die Erzielung von Eink�nften verwendet werden und erfahrungsgem�� l�nger als ein Jahr genutzt werden, �ber die Nutzungsdauer gleichm��ig verteilt werden.

Es ist erforderlich, dass die Kosten f�r die Anschaffung und Herstellung von Wirtschaftsg�tern, die abschreibungsf�hig sind, eine bestimmte Grenze erreichen.
Es ist offensichtlich, dass die lineare Abschreibung der gesetzliche Normalfall ist, da die Absetzung �ber die Nutzungsdauer gleichm��ig verteilt ist.
Es ist nicht mehr erlaubt, die degressive Abschreibung, die fr�her auch �blich war, auf Wirtschaftsg�ter zu verwenden, die nach dem Jahr 2010 erworben wurden.

Abschreibungen gem�� HGB
Die Bewertungsgrunds�tze des Handelsgesetzbuches (HGB) f�r die Verm�gensgegenst�nde, die im Jahresabschluss aufgef�hrt sind,
weisen auch darauf hin, dass Unternehmen planm��ige Abschreibungen vornehmen m�ssen.

Deshalb reduzieren Abschreibungen den Gewinn eines Unternehmens,
selbst wenn in einem bestimmten Jahr keine Anschaffungskosten oder Herstellungskosten angefallen sind.
Im Gegensatz dazu steigert das Abschreibungsprinzip den Gewinn im Jahr des Kaufs. Die Kosten f�r die Anschaffung des Artikels k�nnen in diesem Jahr nicht vollst�ndig ber�cksichtigt werden.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Abschreibungen sind auch in der Betriebswirtschaft sinnvoll, da das Unternehmen jedes Jahr die Kosten f�r die Herstellung oder den Kauf neuer Verm�gensgegenst�nde zur�cklegen kann,
falls die abgeschriebenen Gegenst�nde tats�chlich nicht mehr verwendet werden k�nnen.
Abschreibungen k�nnen auch verwendet werden, um Wertverluste beim Anlageverm�gen und Umlaufverm�gen im Rechnungswesen zu ermitteln.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Im Steuer- und Bilanzrecht ist die lineare Abschreibung eine �bliche Abschreibungsform. j�hrliche Erfassung der Wertminderung mit konstanten Betr�gen.
Die direkte Abschreibung ist eine Methode der Buchhaltung, bei der das Anlagenkonto durch die Abschreibung reduziert wird.
Die Methode der Leistungsabschreibung wird verwendet, um Anlageg�ter abzuschreiben, deren Leistung erfahrungsgem�� stark variiert.
Planm��ige Abschreibung ist die Abschreibung �ber eine vorher festgelegte Nutzungsdauer, die sich teilweise an gesetzlichen Vorgaben orientiert .
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Grunds�tzlich unterscheidet man zwischen der linearen Abschreibung und der degressiven Abschreibung.
Die degressive Abschreibung dagegen hat zur Folge, dass die einzelnen Betr�ge f�r die Abschreibungen jedes Jahr geringer ausfallen.
Denn hier orientiert sich der Satz f�r die Abschreibung immer am aktuellen Restbuchwert� der ja wiederum jedes Jahr durch die Abschreibungen f�llt.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Direkte und indirekte Abschreibungsmethoden
Im Rechnungswesen gibt es zwei Arten von Abschreibungsmethoden: die direkte und die indirekte Abschreibung.
Direkte Abschreibung bedeutet, den Verm�gensposten auf der Passivseite zu reduzieren.
Anders ist es bei der indirekten Abschreibung, bei der alle Abschreibungen zusammengetragen und als Wertberichtigung auf der Aktiv- und Passivseite dargestellt werden.

Leistungsbezogene Abschreibung
Abschreibung nach Leistung h�ngt von der Nutzung eines Wirtschaftsguts ab.
Abschreibungen auf Basis von Leistungen sind besonders vorteilhaft bei Investitionsg�tern, die stark in ihrer Nutzung schwanken.
Sie werden beispielsweise in Fahrzeugen angeboten. 

Au�erplanm��ige Abschreibung
Die au�erplanm��ige Abschreibung erfasst Wertverluste in einem Unternehmen, die nicht durch planm��ige Nutzung verursacht wurden.

Besonderheiten der unvorhergesehenen Abschreibung
Obwohl im Rechnungswesen im Allgemeinen keine Unterschiede zwischen au�erplanm��iger und planm��iger Absetzung der G�ter bestehen,gibt es einige Besonderheiten.
Es besteht die M�glichkeit, eine au�erplanm��ige Abschreibung sowohl bei Anlagen als auch im Umlaufverm�gen vorzunehmen.
Teilabschreibungen sind im Steuerrecht au�erplanm��ige Abschreibungen.

Kalkulatorische Abschreibung
Die kalkulatorische Abschreibung bezieht sich nicht auf die bilanzielle Abschreibung, sondern auf den tats�chlichen Wertverlust des Sachanlageverm�gens.
Der Sinn einer kalkulatorischen Abschreibung besteht darin, dass in einem Unternehmen tats�chliche Kosten entstehen, die bei der Berechnung von Gewinnen und Verlusten nicht erscheinen.
')

INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Wer unsicher ist, wie lange eine Nutzungsdauer f�r bestimmte Wirtschaftsg�ter ben�tigt wird, kann auf AfA-Tabellen zur�ckgreifen.
Das Bundesministerium f�r Finanzen stellt sie her. Allerdings sind sie nicht verbindlich und dienen lediglich als Unterst�tzung.
Die Nutzungsdauer, die in diesen Tabellen angegeben ist, kann je nach Situation vom Unternehmer abweichen.')


INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Was ist der Zweck der Inventur und warum ist sie f�r Unternehmen wichtig?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Arten von Inventurverfahren werden verwendet?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche m�glichen Ma�nahmen k�nnen ergriffen werden, um die Effizienz und Genauigkeit der Inventur zu verbessern?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Wie wird die Genauigkeit und Vollst�ndigkeit der Inventur sichergestellt?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Verm�gensgegenst�nde sind im Inventar enthalten?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Verbindlichkeiten sind im Inventar aufgef�hrt?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Wird das Inventar regelm��ig aktualisiert und angepasst?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche m�gliche Informationen liefert das Inventar �ber die finanzielle Situation des Unternehmens?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Was ist eine Bilanz und welche Informationen liefert sie �ber ein Unternehmen?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Verm�genswerte sind in der Bilanz aufgef�hrt?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Welche Verbindlichkeiten und Eigenkapitalpositionen sind in der Bilanz enthalten?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(1,'Wie wird die Bilanzstruktur aufgebaut und welche Bestandteile hat sie?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(2,'Was ist der Eigenkapitalvergleich und welche Informationen bietet er �ber die finanzielle Position eines Unternehmens?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(2,'Wie nennt man eine erh�hung order verringerung des Eigenkapitals?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(2,'Wie hat sich das Eigenkapital im Vergleich zum Vorjahr/der Vorperiode ver�ndert und was sind die Gr�nde f�r diese Ver�nderungen?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Welche Arten von Bestandskonten gibt es und wie unterscheiden sie sich voneinander?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Wo werden Zug�nge auf Bestandskonten erfasst?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Wie werden Schlussbest�nde auf Bestandskonten erfasst?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(3,'Wie werden Bestandskonten mit anderen Konten in der Buchhaltung verkn�pft, z. B. mit dem Kassenkonto oder dem Verkaufskonto?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Was ist das Grundbuch und welche Funktion erf�llt es in der Buchhaltung?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Welche Arten von Konten werden im Grundbuch gef�hrt und wie unterscheiden sie sich voneinander?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Wie werden Buchungen m�glicherweise im Grundbuch erfasst und wie erfolgt die Dokumentation?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(4,'Wie wird das Grundbuch mit anderen Konten in der Buchhaltung verkn�pft?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(5,'Was ist das Hauptbuch und welche Funktion erf�llt es in der Buchhaltung?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(5,'Wie werden Buchungen im Hauptbuch erfasst und dokumentiert?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(5,'Wie k�nnen m�gliche Fehler im Hauptbuch identifiziert und korrigiert werden?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(6,'Was ist eine Er�ffnungsbilanz und welche Informationen enth�lt sie?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(6,'Was ist eine Schlussbilanz und welche Informationen enth�lt sie?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Was sind Erfolgskonten und welche Rolle spielen sie in der Buchhaltung?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Welche Arten von Erfolgskonten gibt es und wie werden sie kategorisiert?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Wie werden Erl�se und Kosten den entsprechenden Erfolgskonten zugeordnet?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Wie werden Gewinne und Verluste in Erfolgskonten behandelt und verbucht?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(7,'Welche Auswirkungen haben Erfolgskonten auf die Gewinn- und Verlustrechnung?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Was ist das Gewinn- und Verlustkonto und welche Funktion erf�llt es in der Buchhaltung?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Welche Arten von Einnahmen und Ausgaben werden im Gewinn- und Verlustkonto erfasst?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Wie wird der Gewinn oder Verlust eines Unternehmens im Gewinn- und Verlustkonto ermittelt?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(8,'Welche Informationen liefert das Gewinn- und Verlustkonto f�r die finanzielle Analyse und Berichterstattung?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Was sind Abschreibungen und warum sind sie in der Buchhaltung wichtig?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Welche Arten von Abschreibungen gibt es?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Welche Auswirkungen haben Abschreibungen auf die Gewinn- und Verlustrechnung und die Bilanz eines Unternehmens?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(9,'Wie k�nnen Abschreibungen im Rahmen der Steuerplanung optimiert werden?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(10,'Welche Arten von Umsatzsteuers�tzen gibt es und wie werden sie angewendet?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(10,'Was ist Vorsteuer und wie wird sie mit der Umsatzsteuer verkn�pft?')
INSERT INTO Aufgabenstellung(Inhalt_id , AGS_Text) VALUES(10,'Wie werden Umsatzsteuer und Vorsteuer m�glicherweise in der Finanzanalyse verwendet, um die finanzielle Leistung eines Unternehmens zu bewerten?')

INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(1,'Die Inventur ist f�r Unternehmen aus mehreren Gr�nden wichtig

Erf�llung rechtlicher Anforderungen: In vielen L�ndern sind Unternehmen gesetzlich verpflichtet, eine Inventur durchzuf�hren. Dies dient der Einhaltung von steuerlichen Vorschriften, Rechnungslegungsstandards und handelsrechtlichen Bestimmungen.
Diebstahl oder Lagerfehler, identifiziert werden. Es hilft auch bei der Vermeidung von �berbest�nden oder Engp�ssen, indem der Bestand effizient verwaltet werden kann.
Grundlage f�r finanzielle Berichterstattung und Analyse: Die Inventur liefert Daten, die in den Jahresabschluss des Unternehmens einflie�en. Diese Daten dienen der finanziellen Berichterstattung und werden von Investoren, Gl�ubigern und anderen Interessengruppen zur Bewertung der finanziellen Lage und Leistungsf�higkeit des Unternehmens verwendet.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(2,'Es gibt verschiedene Arten von Inventurverfahren, die in Unternehmen verwendet werden. Die Auswahl des geeigneten Verfahrens h�ngt von der Art des Unternehmens, der Gr��e des Bestands und den rechtlichen Anforderungen ab. Hier sind einige g�ngige Inventurverfahren:
Stichtagsinventur: Bei der Stichtagsinventur wird der Bestand an einem bestimmten Stichtag physisch erfasst.
Permanente Inventur: Bei der permanenten Inventur erfolgt die Erfassung des Bestands laufend und fortlaufend w�hrend des gesamten Gesch�ftsjahres. Dadurch wird eine regelm��ige und kontinuierliche �berwachung des Bestands erm�glicht.
Stichprobeninventur: Bei der Stichprobeninventur wird nur eine repr�sentative Auswahl des Bestands �berpr�ft. Anhand dieser Stichproben werden Sch�tzungen f�r den Gesamtbestand erstellt.
Wertm��ige Inventur: Bei der wertm��igen Inventur wird der Bestand nicht physisch erfasst, sondern es werden lediglich die Werte der Verm�gensgegenst�nde und Verbindlichkeiten ermittelt. Dies kann zum Beispiel durch Sch�tzungen, Kalkulationen oder andere Bewertungsmethoden erfolgen.
Teilinventur: Bei der Teilinventur wird nur ein Teil des Bestands erfasst und �berpr�ft. Dies kann entweder aufgrund von praktischen Gr�nden oder aufgrund der Kategorisierung des Bestands erfolgen.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(3,'Die Genauigkeit und Vollst�ndigkeit der Inventur kann durch verschiedene Ma�nahmen sichergestellt werden. Hier sind einige M�glichkeiten:

Gr�ndliche Vorbereitung
Verwendung von Inventurverfahren
Sorgf�ltige physische Bestandserfassung
Einsatz technologischer Hilfsmittel
Kontrollen und Plausibilit�tspr�fungen
Unabh�ngige �berpr�fung
Dokumentation
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(4,'Um die Effizienz und Genauigkeit der Inventur zu verbessern, k�nnen Unternehmen verschiedene Ma�nahmen ergreifen.
Vorbereitung und Planung
Verwendung technologischer Hilfsmittel
Klare Kennzeichnung und Lagerorganisation
Revisionspr�fung
Dokumentation und Nachvollziehbarkeit')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(4,'Im Inventar eines Unternehmens sind in der Regel verschiedene Verm�gensgegenst�nde enthalten. Diese k�nnen je nach Art des Unternehmens und der Branche variieren, aber typischerweise umfassen sie folgende Kategorien von Verm�gensgegenst�nden:

Sachanlagen: Hierzu geh�ren Geb�ude, Grundst�cke, Maschinen, Fahrzeuge, B�rom�bel und andere materielle Verm�genswerte, die f�r den Gesch�ftsbetrieb genutzt werden.
Vorr�te: Dies umfasst Rohmaterialien, Halbfertigprodukte und Fertigwaren, die zum Verkauf bestimmt sind oder f�r die Produktion verwendet werden.
Forderungen: Hierunter fallen offene Rechnungen und Forderungen gegen�ber Kunden und anderen Personen oder Unternehmen, die dem Unternehmen Geld schulden.
Beteiligungen und Wertpapiere: Dies beinhaltet Investitionen des Unternehmens in andere Unternehmen, Aktien, Anleihen oder andere Arten von Wertpapieren.
Liquide Mittel: Dies umfasst Bargeld, Bankguthaben, Schecks und andere kurzfristig verf�gbare Geldmittel des Unternehmens.
Geistiges Eigentum: Hierzu geh�ren Patente, Marken, Urheberrechte und andere immaterielle Verm�genswerte, die dem Unternehmen geh�ren und einen finanziellen Wert haben.
Sonstige Verm�gensgegenst�nde')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(5,'Kurzfristige Verbindlichkeiten: Hierzu geh�ren Verbindlichkeiten, die innerhalb eines Jahres oder weniger f�llig werden, wie beispielsweise Lieferantenverbindlichkeiten, offene Rechnungen, kurzfristige Kredite oder Darlehen und Verbindlichkeiten aus Lohn- und Gehaltszahlungen.
Langfristige Verbindlichkeiten: Dies beinhaltet Verbindlichkeiten, die �ber einen Zeitraum von mehr als einem Jahr f�llig werden, wie beispielsweise langfristige Kredite, Darlehen, Hypotheken oder Anleihen.
R�ckstellungen: Dies sind Verbindlichkeiten, die aus zuk�nftigen Verpflichtungen resultieren, wie beispielsweise R�ckstellungen f�r Garantien, Pensionsverpflichtungen, Steuerr�ckstellungen oder rechtliche Verpflichtungen.
Verbindlichkeiten gegen�ber Mitarbeitern: Hierunter fallen Verbindlichkeiten aus Lohn- und Gehaltszahlungen, Sozialabgaben, Urlaubsanspr�chen oder anderen Verg�tungsverpflichtungen gegen�ber den Mitarbeitern.
Verbindlichkeiten gegen�ber anderen Unternehmen oder Personen: Dies umfasst Verbindlichkeiten, die gegen�ber Lieferanten, Dienstleistern, Kreditgebern, Banken oder anderen Gl�ubigern bestehen, beispielsweise ausstehende Rechnungen, Kredite oder Leasingverpflichtungen.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(6,'Ja, das Inventar wird in der Regel regelm��ig aktualisiert und angepasst.
Die Aktualisierung des Inventars ist wichtig, um sicherzustellen, dass die aufgef�hrten Verm�gensgegenst�nde und Verbindlichkeiten korrekt und aktuell sind.
Die H�ufigkeit der Aktualisierung kann je nach Unternehmen variieren und h�ngt von verschiedenen Faktoren ab, wie zum Beispiel der Art der Gesch�ftst�tigkeit, der Gr��e des Unternehmens und den geltenden gesetzlichen Anforderungen.

Im Allgemeinen gibt es bestimmte Anl�sse oder Ereignisse, die eine Aktualisierung des Inventars erfordern:
Anschaffung oder Verkauf von Verm�gensgegenst�nden
Inventur oder Bestandsaufnahme
�nderungen bei Verbindlichkeiten
Wertanpassungen
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(7,'Verm�genswerte
Verbindlichkeiten
Eigenkapital
Liquidit�t
Verm�gensstruktur
Wertentwicklung')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(8,'Eine Bilanz ist ein wichtiger Bestandteil des Jahresabschlusses eines Unternehmens und gibt einen �berblick �ber die finanzielle Situation zu einem bestimmten Zeitpunkt. Die Aktivseite zeigt die Verm�genswerte des Unternehmens, w�hrend die Passivseite die Verbindlichkeiten und das Eigenkapital darstellt.

Bilanzstruktur: Die Bilanzstruktur zeigt die Aufteilung der Verm�genswerte, Verbindlichkeiten und des Eigenkapitals in verschiedene Kategorien oder Unterkonten. Dies erm�glicht eine detailliertere Analyse der finanziellen Position und der Verm�gensstruktur des Unternehmens.
Liquidit�t: Durch die Bilanz kann man R�ckschl�sse auf die Liquidit�t des Unternehmens ziehen, d.h. die F�higkeit, kurzfristige Verpflichtungen zu erf�llen. Indikatoren wie der Bargeldbestand, kurzfristige Forderungen und kurzfristige Verbindlichkeiten geben Aufschluss �ber die Liquidit�tslage des Unternehmens.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(9,'Sachanlagen: Hierzu geh�ren Geb�ude, Grundst�cke, Maschinen, Fahrzeuge und andere physische Verm�genswerte, die f�r den Gesch�ftsbetrieb genutzt werden.
Immaterielle Verm�genswerte: Dies umfasst geistiges Eigentum wie Patente, Lizenzen, Markenrechte, Urheberrechte, Software und andere nicht-physische Verm�genswerte, die einen wirtschaftlichen Nutzen f�r das Unternehmen darstellen.
Vorr�te: Rohstoffe, Zwischenprodukte, fertige Waren, Handelswaren und andere Best�nde, die zur Produktion von G�tern oder zum Verkauf gehalten werden.
Forderungen: Dies sind ausstehende Betr�ge, die das Unternehmen von Kunden oder anderen Parteien noch zu erhalten hat.
Liquide Mittel: Bargeld, Bankguthaben, Schecks und andere kurzfristig verf�gbare Mittel, die leicht in Zahlungsmittel umgewandelt werden k�nnen.
Anlageverm�gen: langfristige Investitionen')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(10,'Kurzfristige Verbindlichkeiten: Verbindlichkeiten, die innerhalb eines Jahres f�llig werden, wie Lieferantenverbindlichkeiten, Kreditoren, kurzfristige Darlehen, Kreditkartenverbindlichkeiten und sonstige kurzfristige Verbindlichkeiten.
Langfristige Verbindlichkeiten: Verbindlichkeiten, deren R�ckzahlung erst nach einem Jahr oder l�nger f�llig wird, wie langfristige Darlehen, Anleihen, Hypotheken und andere langfristige Verbindlichkeiten gegen�ber Gl�ubigern.
Eigenkapital')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(11,'Die Bilanz ist eine finanzielle Darstellung, die die Verm�genswerte, Verbindlichkeiten und Eigenkapitalpositionen eines Unternehmens zu einem bestimmten Zeitpunkt widerspiegelt. Die Bilanzstruktur besteht aus zwei Hauptteilen: der Aktivseite (auch als Verm�gensseite bezeichnet) und der Passivseite (auch als Kapitalseite bezeichnet).
Aktivseite (Verm�gensseite): Anlageverm�gen: Hier werden langfristige Verm�genswerte erfasst. Umlaufverm�gen: Dies umfasst kurzfristige Verm�genswerte.
Passivseite (Kapitalseite): Verbindlichkeiten: Hier werden sowohl kurzfristige als auch langfristige Verbindlichkeiten erfasst. Eigenkapital: Dies umfasst das von den Eigent�mern oder Aktion�ren des Unternehmens eingezahlte Kapital.')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(12,'Der Eigenkapitalvergleich ist eine Analysemethode, bei der das Eigenkapital eines Unternehmens zu verschiedenen Zeitpunkten verglichen wird, um Ver�nderungen und Trends in der finanziellen Position des Unternehmens zu erkennen. Er bietet Informationen �ber die finanzielle Stabilit�t, Rentabilit�t und das Wachstumspotenzial eines Unternehmens.
Informationen, die der Eigenkapitalvergleich liefern kann:

Ver�nderungen des Eigenkapitals
Kapitalstruktur
Rentabilit�t
Wachstumspotenzial')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(13,'Eine Erh�hung des Eigenkapitals wird als Eigenkapitalzufluss oder Eigenkapitalerh�hung bezeichnet, w�hrend eine Verringerung des Eigenkapitals als Eigenkapitalabfluss oder Eigenkapitalminderung bezeichnet wird. ')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(14,'Die Ver�nderung des Eigenkapitals kann verschiedene Gr�nde haben, darunter:

Gewinne oder Verluste
Eigenkapitaleinlagen oder -entnahmen
Kapitalerh�hungen oder -minderungen
Dividendenaussch�ttungen')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(15,'Hier sind einige g�ngige Arten von Bestandskonten:

Warenbestandskonto
Rohstoffbestandskonto
Fertigerzeugniskonto
Halbfertigerzeugniskonto
Hilfsstoffbestandskonto
Materialbestandskonto')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(17,'Zug�nge auf Bestandskonten werden in der Regel auf der Soll seite des Kontos erfasst.')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(18,'Abg�nge auf Bestandskonten werden in der Regel auf der Haben seite des Kontos erfasst.')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(19,'Bestandskonten werden in der Buchhaltung mit anderen Konten verkn�pft, indem sie in Transaktionen und Buchungen miteinander interagieren.
Verkn�pfung mit dem Kassenkonto
Verkn�pfung mit dem Verkaufskonto
Verkn�pfung mit dem Lieferantenkonto
Verkn�pfung mit dem Herstellungskonto')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(20,'Das Grundbuch ist ein zentrales Buchhaltungsdokument, das zur Erfassung und Aufzeichnung von Gesch�ftsvorf�llen in der doppelten Buchf�hrung verwendet wird.

Dokumentation von Gesch�ftsvorf�llen
Nachweis von Kontenbewegungen
Kontrollinstrument
Grundlage f�r die Erstellung von Abschl�ssen
Nachweis f�r Steuer- und rechtliche Zwecke')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(21,'Im Grundbuch werden verschiedene Arten von Konten gef�hrt, die sich je nach ihrer Funktion und ihrem Zweck voneinander unterscheiden.
Bestandskonten
Erfolgskonten
Hilfskonten
Privatkonten: Privatkonten werden verwendet, um Transaktionen zwischen dem Unternehmen und seinen Eigent�mern oder Gesellschaftern zu erfassen.')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(22,'Buchungen im Grundbuch werden in Form von Eintragungen vorgenommen, um die verschiedenen Konten zu aktualisieren und die finanziellen Transaktionen eines Unternehmens zu dokumentieren. Die Erfassung von Buchungen im Grundbuch erfolgt in der Regel nach dem sogenannten "Doppik-Prinzip" der doppelten Buchf�hrung, bei dem jede Transaktion mindestens zwei Buchungen erfordert - eine Soll-Buchung und eine Haben-Buchung.
Bei der Buchung im Grundbuch werden folgende Schritte durchgef�hrt: Identifizierung der Transaktion, Soll- und Haben-Buchung, Gegenbuchung, Dokumentation
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(23,'Das Grundbuch wird mit anderen Konten in der Buchhaltung durch Buchungen verkn�pft. 
Die Verkn�pfung erfolgt durch das Prinzip der doppelten Buchf�hrung, bei dem jede Transaktion mindestens zwei Buchungen erfordert - eine Soll-Buchung und eine Haben-Buchung
Soll an Haben')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(24,'Das Hauptbuch ist ein zentrales Buchhaltungsdokument, in dem alle Gesch�ftsvorf�lle eines Unternehmens systematisch erfasst werden. Es dient als eine Art Konten�bersicht und enth�lt alle Konten des Unternehmens.
Das Hauptbuch hat mehrere wichtige Funktionen:

Kontenf�hrung
Dokumentation
�berwachung
Erstellung von Abschl�ssen
Fehleridentifikation und -korrektur
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(25,'Bei der Erfassung einer Buchung im Hauptbuch werden in der Regel folgende Informationen dokumentiert:

Datum
Kontonummer
Bezeichnung
Betrag
Die Buchungen werden gem�� dem doppelten Buchf�hrungssystem erfasst, bei dem jeder Buchung sowohl ein Soll- als auch ein Habenbetrag zugeordnet wird. Diese Buchungen stellen den Austausch zwischen den verschiedenen Konten im Hauptbuch dar und halten die Kontost�nde auf dem aktuellen Stand.

Die dokumentierten Journaleintr�ge im Hauptbuch dienen dazu, alle finanziellen Transaktionen eines Unternehmens zu erfassen und zu verfolgen. 
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(26,'Um m�gliche Fehler im Hauptbuch zu identifizieren und zu korrigieren, k�nnen folgende Ma�nahmen ergriffen werden:

Abstimmung der Konten
Kontrollrechnungen
�berpr�fung der Buchungsvorg�nge
Verwendung von Kontenabstimmungssystemen
Interne Kontrollma�nahmen
Die genaue Vorgehensweise zur Korrektur h�ngt von der Art des Fehlers ab. In der Regel werden falsche Buchungen storniert und durch korrekte Buchungen ersetzt. Es ist wichtig, alle �nderungen und Korrekturen nachvollziehbar zu dokumentieren und die Gr�nde f�r die Korrekturen zu protokollieren.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(27,'Eine Er�ffnungsbilanz ist eine Bilanz, die am Anfang eines Gesch�ftsjahres oder beim Start eines neuen Unternehmens erstellt wird. Sie bildet den Ausgangspunkt der Buchhaltung f�r einen bestimmten Zeitraum und zeigt die finanzielle Situation des Unternehmens zu Beginn dieser Periode.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(28,'Eine Schlussbilanz ist eine Bilanz, die am Ende eines Gesch�ftsjahres oder eines bestimmten Abrechnungszeitraums erstellt wird. Sie fasst die finanziellen Aktivit�ten und Transaktionen des Unternehmens w�hrend dieses Zeitraums zusammen und gibt Auskunft �ber die finanzielle Situation des Unternehmens zum Abschlusszeitpunkt. 
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(29,'Erfolgskonten sind Konten in der Buchhaltung, die verwendet werden, um die Ertr�ge und Aufwendungen eines Unternehmens w�hrend eines bestimmten Gesch�ftszeitraums zu erfassen. Sie dienen dazu, den Gewinn oder Verlust des Unternehmens zu ermitteln und erm�glichen eine detaillierte Analyse der Einnahmen und Ausgaben.
Die Rolle der Erfolgskonten besteht darin, die finanziellen Auswirkungen der Gesch�ftst�tigkeit zu verfolgen und zu kategorisieren. Sie erm�glichen es einem Unternehmen, seine Einnahmen, Kosten und Ausgaben auf verschiedene Konten aufzuteilen, um eine bessere �bersicht �ber die finanzielle Leistung zu erhalten. 
Erfolgskonten lassen sich in verschiedene Kategorien unterteilen:
Erl�skonten
Aufwandskonten
Gewinn- und Verlustkonten
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text)  VALUES(30,'Erl�skonten: Diese Konten erfassen die Einnahmen oder Erl�se aus dem Verkauf von Waren oder der Erbringung von Dienstleistungen. 
Umsatzerl�se: Erfasst den Umsatz aus dem Verkauf von Waren oder Dienstleistungen.
Zinsertr�ge: Erfasst Zinseinnahmen aus Anlagen oder Krediten.
Provisionseinnahmen: Erfasst Provisionen, die durch den Verkauf von Produkten oder Dienstleistungen erzielt werden.

Aufwandskonten: Diese Konten erfassen die Kosten und Ausgaben, die im Rahmen der Gesch�ftst�tigkeit anfallen.
Personalkosten: Erfasst Geh�lter, L�hne, Sozialabgaben und andere mit dem Personal verbundene Kosten.
Materialkosten: Erfasst die Kosten f�r den Einkauf oder die Herstellung von Materialien.
Mietkosten: Erfasst die Kosten f�r die Anmietung von R�umlichkeiten oder Ger�ten.
Werbekosten: Erfasst die Kosten f�r Marketing- und Werbeaktivit�ten.
Abschreibungen: Erfasst den Werteverzehr von Anlageverm�gen �ber deren Nutzungsdauer.
Zinskosten: Erfasst die Kosten f�r aufgenommene Kredite oder andere Finanzierungskosten.

Gewinn- und Verlustkonten: Diese Konten werden am Ende des Gesch�ftsjahres verwendet, um den Gewinn oder Verlust des Unternehmens zu ermitteln.
Gewinn: Erfasst den Gesamtgewinn des Unternehmens.
Verlust: Erfasst den Gesamtverlust des Unternehmens.')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(31,'Erl�se:
Umsatzerl�se
Zinsertr�ge
Provisionseinnahmen

Kosten:
Personalkosten
Materialkosten
Mietkosten
Werbekosten
Abschreibungen
Zinskosten')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(32,'Gewinne und Verluste werden in den Erfolgskonten behandelt und verbucht, um die finanzielle Leistung eines Unternehmens zu erfassen.

Gewinne:
Gewinn aus dem operativen Gesch�ft
Sonstige Gewinne

Verluste:
Verluste aus dem operativen Gesch�ft
Sonstige Verluste

Die Verbuchung von Gewinnen und Verlusten erfolgt in der Regel am Ende eines Abrechnungszeitraums, z.B. am Ende eines Gesch�ftsjahres. Dabei werden die Gewinne auf der Habenseite und die Verluste auf der Sollseite des jeweiligen Erfolgskontos verbucht.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(33,'Erfolgskonten haben eine direkte Auswirkung auf die Gewinn- und Verlustrechnung (GuV) eines Unternehmens. Die GuV ist eine wichtige Finanzdokumentation, die die Ertr�ge (Einnahmen) und Aufwendungen (Kosten) eines Unternehmens f�r einen bestimmten Zeitraum, normalerweise ein Gesch�ftsjahr, darstellt.
Umsatzerl�se:Ein h�herer Umsatz f�hrt zu h�heren Ertr�gen und einem potenziell h�heren Gewinn.
Aufwandskonten:Ein h�herer Aufwand f�hrt zu niedrigeren Ertr�gen und potenziell zu einem niedrigeren Gewinn oder sogar zu einem Verlust.
Gewinn- und Verlustkonto:Der Saldo des Gewinn- und Verlustkontos beeinflusst direkt den Gewinn oder Verlust, der in der GuV ausgewiesen wird.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(34,'Das Gewinn- und Verlustkonto (auch GuV-Konto oder Ertragskonto genannt) ist ein zentrales Konto in der Buchhaltung eines Unternehmens. Es dient dazu, alle Ertr�ge (Einnahmen) und Aufwendungen (Kosten) eines Unternehmens f�r einen bestimmten Zeitraum zu erfassen, normalerweise ein Gesch�ftsjahr. Das Gewinn- und Verlustkonto hat folgende Funktionen:
Erfassung von Ertr�gen
Erfassung von Aufwendungen
Ermittlung des Gewinns oder Verlusts
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(35,'Einnahmen:
Umsatzerl�se
Zinsertr�ge
Dividendenertr�ge
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
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(36,'Die Grundformel f�r die Gewinn- und Verlustrechnung lautet:
Gewinn/Verlust = Einnahmen - Ausgaben

Grundlegenden Schritte, um den Gewinn oder Verlust zu ermitteln:
Einnahmen summieren
Ausgaben summieren
Gewinn oder Verlust ermitteln
Durch Subtraktion der Gesamtausgaben von den Gesamteinnahmen wird der Gewinn oder Verlust berechnet. Wenn die Einnahmen die Ausgaben �bersteigen, ergibt sich ein Gewinn. Wenn die Ausgaben die Einnahmen �bersteigen, entsteht ein Verlust.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(37,'Gewinn oder Verlust
Umsatzerl�se
Kosten und Ausgaben
Bruttogewinn
Betriebsergebnis
Steuern und Nettoergebnis')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(38,'Abschreibungen sind in der Buchhaltung wichtige bilanzielle Ma�nahmen, bei denen der Wertverlust von Verm�gensgegenst�nden �ber deren Nutzungsdauer hinweg erfasst wird
Warum Abschreibungen in der Buchhaltung wichtig sind:

Bilanzielle Genauigkeit
Zeitgerechte Kostenzuordnung
Gewinnermittlung
Steuerliche Auswirkungen
Investitionsentscheidungen
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(39,'Lineare Abschreibung: Bei der linearen Abschreibung wird der Wertverlust eines Verm�gensgegenstands gleichm��ig �ber seine Nutzungsdauer verteilt.
Degressive Abschreibung: Die degressive Abschreibung erlaubt eine h�here Abschreibung zu Beginn der Nutzungsdauer und eine allm�hliche Reduzierung in den folgenden Jahren.
Leistungsabh�ngige Abschreibung: Bei der leistungsabh�ngigen Abschreibung wird der Wertverlust eines Verm�gensgegenstands basierend auf seiner tats�chlichen Nutzung oder Produktionsleistung erfasst.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(40,'In der Gewinn- und Verlustrechnung werden Abschreibungen als Aufwand erfasst. Sie mindern den Gewinn eines Unternehmens, da sie den Wertverlust von Verm�gensgegenst�nden �ber deren Nutzungsdauer hinweg abbilden.
In der Bilanz wirken sich Abschreibungen auf die Verm�genswerte aus. Der Buchwert eines Verm�gensgegenstands wird um den Betrag der Abschreibung reduziert. Dadurch spiegelt die Bilanz den tats�chlichen Wert des Verm�gensgegenstands zum jeweiligen Zeitpunkt wider.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(41,'Wahl der Abschreibungsmethode
Nutzung von Sonderabschreibungen
Identifikation von steuerlich beg�nstigten Verm�gensgegenst�nden
Timing von Investitionen
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(42,'Standardsteuersatz: Der Standardsteuersatz ist der allgemeine Steuersatz, der auf die meisten Waren und Dienstleistungen erhoben wird. Er variiert von Land zu Land und kann beispielsweise 19%, 20% oder 21% betragen.
Reduzierter Steuersatz: Ein reduzierter Steuersatz wird oft auf bestimmte Waren und Dienstleistungen angewendet, die als essentiell oder von �ffentlichem Interesse angesehen werden. Dies k�nnen beispielsweise Lebensmittel, B�cher, Medikamente oder �ffentlicher Nahverkehr sein. Der reduzierte Steuersatz ist in der Regel niedriger als der Standardsteuersatz.
Nullsteuersatz: Einige L�nder erheben einen Nullsteuersatz auf bestimmte Waren und Dienstleistungen. Dies bedeutet, dass f�r diese Produkte keine Umsatzsteuer berechnet wird. Beispiele f�r Produkte, die unter den Nullsteuersatz fallen k�nnen, sind Exportg�ter oder bestimmte Finanzdienstleistungen.
Sondersteuers�tze: In einigen F�llen k�nnen spezielle Steuers�tze f�r bestimmte Branchen oder Produkte gelten. Zum Beispiel k�nnen Tabakprodukte, Alkohol, Treibstoffe oder Luxusg�ter h�here Steuers�tze haben.

Die Anwendung der Umsatzsteuers�tze erfolgt durch den Verk�ufer oder Dienstleister, der die Umsatzsteuer im Verkaufspreis oder in der Rechnung an den Kunden berechnet. Der Verk�ufer ist verpflichtet, die eingenommene Umsatzsteuer an die zust�ndige Steuerbeh�rde abzuf�hren. Der Kunde, der die Produkte oder Dienstleistungen erwirbt, zahlt den entsprechenden Steuerbetrag als Teil des Kaufpreises.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(43,'Die Vorsteuer ist der Betrag an Umsatzsteuer, den ein Unternehmen f�r Eink�ufe und Gesch�ftsausgaben gezahlt hat. Es handelt sich um die Umsatzsteuer, die auf den Einkaufspreis von Waren oder Dienstleistungen erhoben wurde. Die Vorsteuer kann vom Unternehmen als Vorabzahlung auf die Umsatzsteuerschuld verrechnet werden, die es von seinen Kunden erh�lt.
Die Berechnung des Umsatzsteuerbetrags, den ein Unternehmen an das Finanzamt abf�hren muss, erfolgt in der Regel durch die Differenz zwischen der Umsatzsteuer, die es von seinen Kunden eingenommen hat, und der Vorsteuer, die es f�r seine eigenen Eink�ufe gezahlt hat. Wenn die Vorsteuer den Betrag der eingenommenen Umsatzsteuer �bersteigt, ergibt sich ein �berschuss, der dem Unternehmen erstattet wird.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(44,'Liquidit�tsanalyse: Die Analyse der Umsatzsteuerzahlungen und Vorsteuerr�ckerstattungen kann Aufschluss �ber die Liquidit�tssituation eines Unternehmens geben. Wenn ein Unternehmen regelm��ig hohe Umsatzsteuerzahlungen leistet, kann dies seine Liquidit�t beeinflussen.
Steuerplanung: Durch eine effektive Nutzung von Vorsteuerr�ckerstattungen kann ein Unternehmen seine Steuerbelastung reduzieren und seine finanzielle Leistung verbessern.
Kostenanalyse: Die Analyse der Vorsteuer kann Aufschluss �ber die Kostenstruktur eines Unternehmens geben.
Compliance und Risikomanagement: Dies hilft, finanzielle Risiken wie Strafen und Zinsen zu vermeiden.
')