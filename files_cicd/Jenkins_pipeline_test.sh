#!/usr/bin/bash
echo "##--- start Jenkins-pipeline @`date`"
echo ""
echo "##--- Step1: check env..."
echo "##... run CheckEnv ..."
sleep 1
echo ""
echo "##--- Step2: generate/update Makefiles..."
echo "##... run prjMakefileGen ..."
sleep 1
echo ""
echo "##--- Step3: compile..."
echo "##... run make ..."
sleep 1
echo ""
echo "##--- Step4: check if compile=successful..."
echo "##... run resultCheck ..."
sleep 1
echo ""
echo "##--- Step5: run HW-in-the-loop ..."
echo "##... run mdb myTest_mdbcmds.txt ..."
sleep 1
echo ""
echo "##--- done with Jenkins-pipeline @`date`"
echo ""