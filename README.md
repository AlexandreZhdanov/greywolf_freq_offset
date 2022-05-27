# greywolf_freq_offset
Frequency offset estimation by grey wolf optimization

## Название: greywolf.m

Зависимости: 

	Matlab >2012
	GWO.m, initialization.m - файлы из https://github.com/mzychlewicz/GWO

Функциональное назначение: 
Применить алгоритм оптимизациии "серый волк" для компенсации частотного раcсогласования (frequency offset)

Логическая структура:
 
	costF.m функция стоимости
	greywolf.m запускаемый файл
	
### Алгоритм
Предполагается сигнал QPSK с нескомпенсированным частотным рассогласованием. 
Cтроится функция стоимости для чего из значений фаз комплексных отсчетов сигнала умноженного на комплексную синусоиду с частотой w0 строится гистограмма.
Метрику определяют как разность сумм 4 максимальных ячеек гистограммы и 4 минимальных ячеек.
Для оптимизации параметра w0 используют алгоритм оптимизациии "серый волк" из  https://github.com/mzychlewicz/GWO



### Запуск 

Установить желаемsq параметр snr в файле greywolf.m и запустить его.
Также можно установить желаемое рассогласование частот.
Результат: ошибка компенсации частоты, график функции подлежащей оптимизациии, фазовый портрет отсчетов сигнала до и после компенсации 
