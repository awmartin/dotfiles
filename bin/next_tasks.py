#!/usr/bin/env python

"""Utility to extract the next task of each project from a set of Taskpaper projects."""

import os
import sys
import re

HEADER = '\033[95m'
OKBLUE = '\033[94m'
OKGREEN = '\033[92m'
WARNING = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'

todo_path = os.environ["DOCUMENTS_DIR"]

project_regex = re.compile(r'.*:\w*\n')
task_regex = re.compile(r'^[\t|\s]*-.*\n')
done_regex = re.compile(r'.*@done.*\n')

def format_task(line):
    return HEADER + line.replace("\t", "").replace("\n", "")[:100] + ENDC

def format_filename(filename):
    basename = os.path.basename(filename)

    color = OKGREEN
    colored_basename = color + basename + ENDC

    tr = filename
    tr = tr.replace(basename, colored_basename)
    tr = tr.replace(".taskpaper", "")
    tr = tr.replace(todo_path + os.path.sep, "")
    return tr

def format_entry(project_name):
    tr = " " * 20 + ": " + str(project_name)
    return tr[0:58].replace("\t", "")

def print_entry(entry, task):
    print '{:<60} {}'.format(entry.replace(":", " "), task)

def get_next_tasks(filename):

    f = open(os.path.join(todo_path, filename), "r")
    lines = f.readlines()
    f.close()

    project_name = None

    print ""
    print format_filename(filename)

    for line in lines:
        if project_name is not None:
            if re.match(task_regex, line) and not re.match(done_regex, line):
                task = format_task(line)

                entry = format_entry(project_name)

                print_entry(entry, task)

                project_name = None

        if re.match(project_regex, line):
            # if get_first_task:
            #     # Previous project didn't have a first task.
            #     pass
            project_name = line.replace("\n", "")


def main(argv):
    nameFilter = None
    if len(sys.argv) > 1:
        nameFilter = sys.argv[1]

    for root, dirs, files in os.walk(todo_path):
        for filename in files:
            if filename.endswith(".taskpaper"):
                if nameFilter is not None:
                    if nameFilter.lower() in filename.lower():
                        get_next_tasks(os.path.join(root, filename))
                else:
                    get_next_tasks(os.path.join(root, filename))


if __name__ == "__main__":
    main(sys.argv)

