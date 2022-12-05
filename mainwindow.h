# ifndef MAINWINDOW_H
# определить  MAINWINDOW_H

# включить  < QMainWindow >
# включить  < QLabel >
# включить  < QLineEdit >
# включить  < QPushButton >

класс  MainWindow : общедоступный  QMainWindow
{
    Q_OBJECT

публичный:
    явное  MainWindow (QWidget *parent = 0 );
    ~ГлавноеОкно ();
    QLineEdit *line_1;
    QLineEdit *line_2;
    QLineEdit *line_buff;
   частные слоты:
     пустые цифры_числа ( );
    пустые  операции ();
     пустая цифраClicked ( );
    недействительным  unaryOperatorClicked ();
    Пустой  добавочный операторClicked ();
    недействительным  multiplicativeOperatorClicked ();
    недействительным  равным кликам ();
    недействительный  дел ();
    недействительным  очистить все ();
     пустая точкаClicked ( );
    на самом  деле ( двойное n );
    // Пусто ясно();
частный:
    аннулировать  операцию прерывания ();
    bool  вычислить ( двойной правый операнд, константа QString &pendingOperator) ;
    // void on_button_clicked(QPushButton *digitButtons);
};

# endif  // MAINWINDOW_H
