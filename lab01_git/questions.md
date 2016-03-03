# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/diegomartinez33/lab_vision.git

2.  What is the output of the ``cal`` command?

        Shows the calendar with today's date marked or sticked out

# Homework Questions

1.  What is the ``grep``command?
    >   find text or strings inside a file

2.  What is a *makefile*?
    >   it is a type of file that directs make command with the instructions of how to compile a source file

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   finds a directory but it didn't show its subfolders or files

    $ find gittest
    gittest
    gittest/aaa.txt
    gittest/.git
    gittest/.git/branches
    gittest/.git/packed-refs
    gittest/.git/logs
    gittest/.git/logs/HEAD
    gittest/.git/logs/refs
    gittest/.git/logs/refs/remotes
    gittest/.git/logs/refs/remotes/origin
    gittest/.git/logs/refs/remotes/origin/master
    gittest/.git/logs/refs/remotes/origin/HEAD
    gittest/.git/logs/refs/heads
    gittest/.git/logs/refs/heads/master
    gittest/.git/info
    gittest/.git/info/exclude
    gittest/.git/config
    gittest/.git/COMMIT_EDITMSG
    gittest/.git/hooks
    gittest/.git/hooks/pre-rebase.sample
    gittest/.git/hooks/commit-msg.sample
    gittest/.git/hooks/post-update.sample
    gittest/.git/hooks/update.sample
    gittest/.git/hooks/pre-commit.sample
    gittest/.git/hooks/prepare-commit-msg.sample
    gittest/.git/hooks/applypatch-msg.sample
    gittest/.git/hooks/pre-applypatch.sample
    gittest/.git/hooks/pre-push.sample
    gittest/.git/index
    gittest/.git/description
    gittest/.git/objects
    gittest/.git/objects/28
    gittest/.git/objects/28/fa9aed2a3ef58a372f7092b82f185393611247
    gittest/.git/objects/55
    gittest/.git/objects/55/24ba8e41c57e4bf0a33389a658d001041901ac
    gittest/.git/objects/info
    gittest/.git/objects/ab
    gittest/.git/objects/ab/e2fba96f3ced2f7b85b9fb9fe8662f913d06f4
    gittest/.git/objects/7f
    gittest/.git/objects/7f/21603cc5ae40d0fbdb074920a8f2b6cbd38b86
    gittest/.git/objects/67
    gittest/.git/objects/67/3071bcf2c3a898470e9ff09f9c3bd13a4d5b63
    gittest/.git/objects/8d
    gittest/.git/objects/8d/b9c4f185de9b3495b212c8514bf43157f8db96
    gittest/.git/objects/pack
    gittest/.git/objects/23
    gittest/.git/objects/23/34415bfa56bd8a8dce2021a520a2036677b9c7
    gittest/.git/objects/cc
    gittest/.git/objects/cc/11b3e5baf18ec061e13f4c7121e25a92c422f7
    gittest/.git/objects/80
    gittest/.git/objects/80/bc58e5f78ae6987d4751febd0c1ec3aa9e8c45
    gittest/.git/HEAD
    gittest/.git/refs
    gittest/.git/refs/remotes
    gittest/.git/refs/remotes/origin
    gittest/.git/refs/remotes/origin/master
    gittest/.git/refs/remotes/origin/HEAD
    gittest/.git/refs/tags
    gittest/.git/refs/heads
    gittest/.git/refs/heads/master
    
    On the other hand
    
    $ find gittest -prune
    gittest


5.  Where is the ``grub.cfg``  file
    >   it's a file that creats a list of operating systems "to boot in GRUB's menu interface, essentially allows the user to     select a pre-set group of commands to execute."               https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/3/html/Reference_Guide/s1-grub-configfile.html

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   0

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   0

8.  What does the ``cut`` command do?
    >   remove sections from each line of files

9.  What does the ``wget`` command do?
    >   download files from web even if the user is not logged on

9.  What does the ``rsync`` command do?
    >   copy and syncronize fieles remotely

10.  What does the ``diff`` command do?
    >   compares files line by line and prints the lines that are different

10.  What does the ``tail`` command do?
    >   prints last lines from a fail

10.  What does the ``tail -f`` command do?
    >   output appended data as the file grows

10.  What does the ``link`` command do?
    >   call the link function to create a link to a file. a file that points to the same data as the linked file

11.  How many users exist in the course server?
    >   answer

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   answer

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   answer

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   answer

17. How many unique images are in the ``sipi_images`` database?
    >   answer
    
