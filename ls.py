import os
import os.path
import sys


def main():
    files, dirs = None, None

    # find the dir name path
    try:
        path = sys.argv[1]
    except IndexError:
        path = os.getcwd()  # path of ls.py - default path

    # check if dir
    if os.path.isdir(path):
        print("\nls for the directory: " + path + '\n')

        # find all dirs and files in dir
        for r, d, f in os.walk(path):
            dirs = d
            files = f
            break

        # print all dirs and files and the num of dir and files
        print("Dirs:")
        for dir in dirs:
            print(dir)
        print("Num of dirs: " + str(len(dirs)) + '\n')

        print("Files:")
        for file in files:
            print(file)
        print("Num of files: " + str(len(files)) + '\n')

    else:
        # if not a dir print msg
        print("Not a dir.")


if __name__ == '__main__':
    main()
