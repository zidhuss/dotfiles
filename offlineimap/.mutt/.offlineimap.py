#!/usr/bin/env python
# encoding: utf-8
from subprocess import check_output

def get_pass(account):
    return check_output("pass mail/"+account+" | head -1", shell=True).strip()
