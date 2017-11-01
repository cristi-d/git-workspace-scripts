#!/bin/bash

cd $1

echo "+ $1"
echo ""
git pull origin master
echo ""


cd ..
