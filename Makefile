
CC=gcc
DelCom=del

User=chrisor

PythonHeaderLocation=C:\Users\$(User)\anaconda3\include
PythonFlagLibLocation=C:\Users\$(User)\anaconda3\libs
PythonVersionFlag=-lpython38

GuiName=GUI.ui
Gui2Name=GUI2.ui
Gui3Name=GUI3.ui

CCodeDir=.\C Code
PydDir=.\Python Code\PythonC
GuiDir=.\Python Code

all:
	$(CC) -c -I $(PythonHeaderLocation) "$(CCodeDir)\Disease.c" -o DiseaseC.o
	$(CC) -shared -s DiseaseC.o -L $(PythonFlagLibLocation) $(PythonVersionFlag) -o "$(PydDir)\DiseaseC.pyd"
	$(DelCom) DiseaseC.o
	$(CC) -c -I $(PythonHeaderLocation) "$(CCodeDir)\Group.c" -o GroupC.o
	$(CC) -shared -s GroupC.o -L $(PythonFlagLibLocation) $(PythonVersionFlag) -o "$(PydDir)\GroupC.pyd"
	$(DelCom) GroupC.o

gui:
	pyuic5 -x $(GuiName) -o "$(GuiDir)\XMLOut.py"
	pyuic5 -x $(Gui2Name) -o "$(GuiDir)\XMLOut2.py"
	pyuic5 -x $(Gui3Name) -o "$(GuiDir)\XMLOut3.py"

clean:
	$(DelCom) "$(PydDir)\DiseaseC.pyd"
	$(DelCom) "$(PydDir)\GroupC.pyd"