#!/usr/bin/env python

"""Utility to extract the next task of each project from a set of Taskpaper projects."""

import os
import re

HEADER = '\033[95m'
OKBLUE = '\033[94m'
OKGREEN = '\033[92m'
WARNING = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'


todo_path = os.environ["WORKING_DIR"]

project_regex = re.compile(r'.*:\w*\n')
task_regex = re.compile(r'^[\t|\s]*-.*\n')
done_regex = re.compile(r'.*@done.*\n')

def format_task(line):
    return HEADER + line.replace("\t", "").replace("\n", "") + ENDC

def format_project(filename):
    return filename.replace(".taskpaper", "")

def format_entry(filename, project_name):
    tr = format_project(filename) + ": " + str(project_name)
    return tr[0:58].replace("\t", "")

def print_entry(entry, task):
    print '{:<60} {}'.format(entry, task)

def get_next_tasks(filename):

    f = open(os.path.join(todo_path, filename), "r")
    lines = f.readlines()

    project_name = None

    for line in lines:
        if project_name is not None:
            if re.match(task_regex, line) and not re.match(done_regex, line):
                task = format_task(line)
                entry = format_entry(filename, project_name)

                print_entry(entry, task)

                project_name = None

        if re.match(project_regex, line):
            # if get_first_task:
            #     # Previous project didn't have a first task.
            #     pass
            project_name = line.replace("\n", "")


def main():
    for root, dirs, files in os.walk(todo_path):
        for filename in files:
            if filename.endswith(".taskpaper"):
                get_next_tasks(filename)

if __name__ == "__main__":
    main()

