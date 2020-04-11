#!/bin/bash
sed "s/tagVersion/$1/g" myweb.yaml > mywebtagVersion.yaml
