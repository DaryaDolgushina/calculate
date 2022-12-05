# включить  " mainwindow.h "
# включить  " ui_mainwindow.h "
# включить  < QLineEdit >
# включить  < QVBoxLayout >
# включить  < QButtonGroup >
# включить  < QPushButton >
# включить  < QHBoxLayout >
# включить  < QGridLayout >
# включить  < QFont >
# включить  < QLabel >

логический ожидаемый для операнда = истина ;
QString все;
QString pendingAdditiveOperator;
QString pendingMultiplicativeOperator;
двойная суммаSoFar = 0.0 ;
двойной факторSoFar = 0.0 ;

MainWindow::MainWindow (QWidget *parent):
    QMainWindow (родительский)
{
    QGridLayout *grid = новый QGridLayout;
    QVBoxLayout *label_lay = новый   QVBoxLayout;
    QHBoxLayout *clear_lay = новый   QHBoxLayout;
    line_1 = новый  QLineEdit ( " 0 " );
    line_2 = новый  QLineEdit ( " 0 " );
    line_buff = новый  QLineEdit ( " 0 " );
    строка_1-> setReadOnly ( true );
    line_2-> setReadOnly ( true );
    QPushButton *clear = новый  QPushButton ( это );
    QPushButton *del = новый  QPushButton ( это );
    подключить (очистить, СИГНАЛ ( нажал ()), это , СЛОТ ( очиститьВсе ()));
    подключить (удалить, СИГНАЛ ( нажал ()), это , СЛОТ ( удалить ()));

    line_1 -> setStyleSheet ( " QLineEdit {цвет фона: rgb (242, 244, 243); граница: 1px сплошной rgb (242, 244, 243)} " );
    line_2 -> setStyleSheet ( « QLineEdit {цвет фона: rgb (127, 124, 136); граница: 1px сплошной rgb (127, 124, 136)} » );
    line_1 -> setSizePolicy (QSizePolicy::Expanding, QSizePolicy::Preferred);
    line_2 -> setSizePolicy (QSizePolicy::Expanding, QSizePolicy::Preferred);

    очистить -> установить текст ( « Очистить » );
    clear- > setSizePolicy (QSizePolicy::Expanding, QSizePolicy::Preferred);

    del -> setText ( " Удалить " );
    del- > setSizePolicy (QSizePolicy::Expanding, QSizePolicy::Preferred);
    del-> setFont ( QFont ( " consolas " , 9 ));

    label_lay-> addWidget (line_1);
    label_lay-> addWidget (line_2);
    clear_lay-> addWidget (очистить);
clear_lay-     > добавить виджет (удалить );

    сетка- > setSpacing ( 1 );
    сетка- > setMargin ( 1 );
    clear_lay-> setSpacing ( 1 );
    clear_lay-> setMargin ( 1 );

    line_1-> setMinimumSize ( 170 , 40 );
    line_2-> setMinimumSize ( 170 , 40 );

    очистить- > установитьMinimumSize ( 84 , 40 );
    clear- > setStyleSheet ( " QPushButton {цвет фона: rgb (115, 83, 186); граница: 1px сплошной rgb (115, 83, 186)} QPushButton: hover {цвет фона: rgb (137, 109, 197) ; граница: 1px сплошная rgb(115, 83, 186)} QPushButton:нажата {цвет фона: rgb(239, 195, 245); граница: 1px сплошная rgb(239, 195, 245)} " );
    clear-> setFont ( QFont ( " consolas " , 9 ));
    del- > setMinimumSize ( 84 , 40 );
    del- > setStyleSheet ( " QPushButton {цвет фона: rgb (115, 83, 186); граница: 1px сплошной цвет rgb (115, 83, 186)} QPushButton: hover {цвет фона: rgb (137, 109, 197) ; граница: 1px сплошная rgb(115, 83, 186)} QPushButton:нажата {цвет фона: rgb(239, 195, 245); граница: 1px сплошная rgb(239, 195, 245)} " );

значения     QList<QString> (
                    { " 1 " , " 2 " , " 3 " , " + " ,
                      " 4 " , " 5 " , " 6 " , " - " ,
                      " 7 " , " 8 " , " 9 " , " * " ,
                      " 0 " , " . " , " / " , " = " ,
                      " n^2 " , " √n " , " n! " , " log n " ,
                      " sin n " , " cos n " , " tg n " , " ctg n "
                    });

    QButtonGroup *buttons = new  QButtonGroup ( this );

    QPushButton *digitButtons[ 24 ];

      for ( int i= 0 ; i<values.length ( ); i++){
          digitButtons[i] = новая  кнопка QPushButton ();
          if (i< 15 ) digitButtons[i]-> setStyleSheet ( " QPushButton {цвет фона: rgb (172, 153, 214); граница: 1px сплошной цвет rgb (172, 153, 214)} QPushButton: hover {цвет фона : rgb(196, 182, 226); граница: 1px сплошная rgb(196, 182, 226)} 245)} " );
          иначе  если (i> 15 ) digitButtons[i]-> setStyleSheet ( " QPushButton {цвет фона: rgb (95, 80, 145); граница: 1px сплошной rgb (95, 80, 145)} QPushButton: hover {фон- цвет: rgb(116, 100, 166); граница: 1px сплошная rgb(116, 100, 166)} , 242)} " );
          else  if (i== 15 ) digitButtons[i]-> setStyleSheet ( " QPushButton {цвет фона: rgb (208, 206, 186); граница: 1px сплошной rgb (208, 206, 186)} QPushButton: hover {фон -color: rgb(230, 229, 219); граница: 1px сплошная rgb(230, 229, 219)} 229, 126)} " );
          digitButtons[i]-> setSizePolicy (QSizePolicy::Expanding, QSizePolicy::Preferred);
          digitButtons[i]-> setText (значения[i]);
          digitButtons[i]-> setFont ( QFont ( " consolas " , 9 ));
          if (i!= 3 && i!= 7 && i!= 11 && i< 13 )     connect (digitButtons[i], SIGNAL ( clicked ()), this , SLOT ( digitClicked ()));
          else  if (i== 3 || i== 7 ) connect (digitButtons[i], SIGNAL ( clicked ()), this , SLOT ( AdditionOperatorClicked ()));
          else  if (i== 13 ) connect (digitButtons[i], SIGNAL ( clicked ()), this , SLOT ( pointClicked ()));
          else  if (i== 14 || i== 11 ) connect (digitButtons[i], SIGNAL ( clicked ()), this , SLOT ( multiplicativeOperatorClicked ())));
          else  if (i== 15 ) connect (digitButtons[i], SIGNAL ( clicked ()), this , SLOT ( equalClicked ()));
          else  if (i> 15 ) connect (digitButtons[i], SIGNAL ( clicked ()), this , SLOT ( unaryOperatorClicked ())));
          Кнопки-> добавитьКнопку (digitButtons[i],i);
      }
    инт поз = 0 ;

    for ( int i= 0 ; i<значения. длина ()/ 4 ; i++) {
        for ( int j = 0 ; j < 4 ; j ++) {
         кнопки-> кнопка (поз)-> setMinimumSize ( 40 , 40 );
         grid-> addWidget (buttons-> button (pos),i,j);
         поз++;
        }
    }
    label_lay-> addLayout (clear_lay);
    label_lay-> addLayout (сетка);

    автоматический центральный = новый QWidget;
    центральный -> setStyleSheet ( « цвет фона: rgb (15,16,32) » );
    центральный -> setMinimumSize ( 300 , 300 );
    центральный-> setLayout (label_lay);
    setCentralWidget (центральный);
}

пустота  MainWindow::digitClicked ()
{
    QPushButton *clickedButton = (QPushButton *) отправитель ();
    all+=clickedButton-> текст ();
    int digitValue = clickedButton-> text (). кИнт ();
    если (line_buff-> text () == " 0 " && digitValue == 0.0 )
        возврат ;

    если (ожидание для операнда) {
        line_buff-> очистить ();
        ожидание для операнда = ложь ;
    }
    line_buff-> setText (line_buff-> text () + QString::number (digitValue));
    line_1-> setText (все);
}
bool  MainWindow::calculate ( double rightOperand, const QString &pendingOperator)
{
    если (Оператор ожидания == " + " ) {
        sumSoFar += правый операнд;
    } иначе  если (ожидающий оператор == " - " ) {
        sumSoFar -= правый операнд;
    } иначе  если (ожидающий оператор == " * " ) {
        factorSoFar *= правый операнд;
    } иначе  если (ожидающий оператор == " / " ) {
        если (rightOperand == 0.0 )
            вернуть  ложь ;
        factorSoFar /= правый операнд;
    }
    вернуть  истину ;
}

int  MainWindow::fact ( двойное n)
{
    интервал f= 1 , я;
    для (я = 2 ; я <= п; ++ я) {
        f=f*i;
    }
    вернуть ф;
}

void  MainWindow::unaryOperatorClicked ()
{
    QPushButton *clickedButton = (QPushButton *) отправитель ();
    QString clickedOperator = clickedButton-> text ();
    двойной операнд = строка_1-> текст (). удвоить ();
    двойной результат = 0.0 ;

    if (clickedOperator == ( " √n " )) {
        если (операнд < 0.0 ) {
            line_2-> setText ( tr ( " #### " ));
            возврат ;
        }
        результат = sqrt (операнд);
    }
    иначе  если (clickedOperator == ( " n ^ 2 " )) {
        результат = pow (операнд, 2.0 );
    }
    иначе  если (clickedOperator == ( " n! " )) {
        если (операнд == 0.0 ) {
            line_2-> setText ( tr ( " #### " ));
            возврат ;
        }
        результат = факт (операнд);
    }
    иначе  если (clickedOperator == ( " log n " )) {
            если (операнд == 0.0 ) {
                line_2-> setText ( tr ( " #### " ));
                возврат ;
            }
            результат = журнал (операнд);
        }
    иначе  если (clickedOperator == ( " sin n " )) {
            результат = грех (операнд);
        }
    иначе  если (clickedOperator == ( " cos n " )) {
            результат = cos (операнд);
        }
    иначе  если (clickedOperator == ( " tg n " )) {
            если (операнд == 0.0 ) {
                line_2-> setText ( tr ( " #### " ));
                возврат ;
            }
            результат = загар (операнд);
        }
    иначе  если (clickedOperator == ( " ctg n " )) {
            если (операнд == 0.0 ) {
                line_2-> setText ( tr ( " #### " ));
                возврат ;
            }
            результат = 1 / тангенс (операнд);
        }
    line_2-> setText ( QString::number (результат));
    ожидание для операнда = истина ;
}

void  MainWindow::additiveOperatorClicked ()
{
     QPushButton *clickedButton = (QPushButton *) отправитель ();
     all+=clickedButton-> текст ();
     QString clickedOperator = clickedButton-> text ();
     двойной операнд = line_buff-> текст (). удвоить ();
     if (!pendingMultiplicativeOperator. isEmpty ()) {
         if (! вычислить (операнд, pendingMultiplicativeOperator)) {
             line_2-> setText ( tr ( " #### " ));
             возврат ;
         }
         line_buff-> setText ( QString::number (factorSoFar));
         операнд = факторSoFar;
         факторSoFar = 0.0 ;
         ожидающий мультипликативоператор. очистить ();
     }
     if (!pendingAdditiveOperator. isEmpty ()) {
             if (! вычислить (операнд, pendingAdditiveOperator)) {
                 line_2-> setText ( tr ( " #### " ));
                 возврат ;
             }
     line_2-> setText ( QString::number (sumSoFar));
     } еще {
              sumSoFar = операнд;
          }
     pendingAdditiveOperator = clickedOperator;
     ожидание для операнда = истина ;
}

void  MainWindow::multiplicativeOperatorClicked ()
{
    QPushButton *clickedButton = (QPushButton *) отправитель ();
    all+=clickedButton-> текст ();
    QString clickedOperator = clickedButton-> text ();
    двойной операнд = line_buff-> текст (). удвоить ();

    if (!pendingMultiplicativeOperator. isEmpty ()) {
        if (! вычислить (операнд, pendingMultiplicativeOperator)) {
            line_2-> setText ( tr ( " #### " ));
            возврат ;
        }
        line_2-> setText ( QString::number (factorSoFar));
    } еще {
        факторSoFar = операнд;
    }

    pendingMultiplicativeOperator = clickedOperator;
    ожидание для операнда = истина ;
}

пустота  MainWindow::equalClicked ()
{
    двойной операнд = line_buff-> текст (). удвоить ();

    if (!pendingMultiplicativeOperator. isEmpty ()) {
        if (! вычислить (операнд, pendingMultiplicativeOperator)) {
            line_2-> setText ( tr ( " #### " ));
            возврат ;
        }
        операнд = факторSoFar;
        факторSoFar = 0.0 ;
        ожидающий мультипликативоператор. очистить ();
    }
    if (!pendingAdditiveOperator. isEmpty ()) {
        if (! вычислить (операнд, pendingAdditiveOperator)) {
            line_2-> setText ( tr ( " #### " ));
            возврат ;
        }
        ожидающий аддитивоператор. очистить ();
    } еще {
        sumSoFar = операнд;
    }

    line_2-> setText ( QString::number (sumSoFar));
    line_1-> setText (все);
    суммаСоФар = 0.0 ;
    ожидание для операнда = истина ;
}

пустота  MainWindow::pointClicked ()
{
    если (ожидание операнда)
        строка_1-> setText ( " 0 " );
    если (!line_1-> текст (). Содержит ( " . " )){
        line_1-> setText (line_1-> text () + ( " . " ));
        line_buff-> setText (line_buff-> text () + ( " . " ));
        все+= " . " ;
    }
    ожидание для операнда = ложь ;
}
пустота  MainWindow::del ()
{
     если (ожидание операнда)
         возврат ;

     QString text=line_buff-> text ();
     текст. рубить ( 1 );
     все. рубить ( 1 );
     если (текст. isEmpty ()) {
         текст = " 0 " ;
         ожидание для операнда = истина ;
     }
     line_1-> setText (текст);
     line_buff-> setText (текст);
}

недействительным  MainWindow::clearAll ()
{
    суммаСоФар = 0.0 ;
    факторSoFar = 0.0 ;
    все. очистить ();
    ожидающий аддитивоператор. очистить ();
    ожидающий мультипликативоператор. очистить ();
    строка_1-> очистить ();
    строка_2-> очистить ();
    line_buff-> очистить ();
    ожидание для операнда = истина ;
}
MainWindow::~MainWindow ()
{
}
Нижний колонитул
© 2022 GitHub, Inc.
Нижний колонтитул навигации
Условия
Конфиденциальность
Безопасность
Статус
Документы
Связаться с GitHub
Цены
API
Подготовка
Блог
О
