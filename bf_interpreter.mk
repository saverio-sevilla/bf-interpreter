##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=bf_interpreter
ConfigurationName      :=Debug
WorkspaceConfiguration := $(ConfigurationName)
WorkspacePath          :=C:/Users/Saverio/Desktop/Programs/C/C_workspace
ProjectPath            :=C:/Users/Saverio/Desktop/Programs/C/C_workspace/bf_interpreter
IntermediateDirectory  :=../build-$(ConfigurationName)/bf_interpreter
OutDir                 :=../build-$(ConfigurationName)/bf_interpreter
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Saverio
Date                   :=14/02/2022
CodeLitePath           :="C:/Program Files/CodeLite"
LinkerName             :=C:/MinGW/bin/g++.exe
SharedObjectLinkerName :=C:/MinGW/bin/g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=..\build-$(ConfigurationName)\bin\$(ProjectName).exe
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=$(IntermediateDirectory)/ObjectsList.txt
PCHCompileFlags        :=
RcCmpOptions           := 
RcCompilerName         :=C:/MinGW/bin/windres.exe
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := C:/MinGW/bin/ar.exe rcu
CXX      := C:/MinGW/bin/g++.exe
CC       := C:/MinGW/bin/gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := C:/MinGW/bin/as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\Program Files\CodeLite
Objects0=../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: MakeIntermediateDirs $(OutputFile)

$(OutputFile): ../build-$(ConfigurationName)/bf_interpreter/.d $(Objects) 
	@if not exist "..\build-$(ConfigurationName)\bf_interpreter" mkdir "..\build-$(ConfigurationName)\bf_interpreter"
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@if not exist "..\build-$(ConfigurationName)\bf_interpreter" mkdir "..\build-$(ConfigurationName)\bf_interpreter"
	@if not exist ""..\build-$(ConfigurationName)\bin"" mkdir ""..\build-$(ConfigurationName)\bin""

../build-$(ConfigurationName)/bf_interpreter/.d:
	@if not exist "..\build-$(ConfigurationName)\bf_interpreter" mkdir "..\build-$(ConfigurationName)\bf_interpreter"

PreBuild:


##
## Objects
##
../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(ObjectSuffix): bf_interpreter.c ../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Saverio/Desktop/Programs/C/C_workspace/bf_interpreter/bf_interpreter.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/bf_interpreter.c$(ObjectSuffix) $(IncludePath)
../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(DependSuffix): bf_interpreter.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(ObjectSuffix) -MF../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(DependSuffix) -MM bf_interpreter.c

../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(PreprocessSuffix): bf_interpreter.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ../build-$(ConfigurationName)/bf_interpreter/bf_interpreter.c$(PreprocessSuffix) bf_interpreter.c


-include ../build-$(ConfigurationName)/bf_interpreter//*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r $(IntermediateDirectory)


