Dropbox
=======

CS 360 project designed to teach us cloud storage

We are going to be bosses and recreate student filesharing browser application similar to Dropbox. Here's an email I sent out earlier with details on what we may do.

Framework:
-Rails: This seemed to be the most popular for us after the previous lecture
-Padrino: I recommend this as a backup, but we seemed to like Rails more

Database: SQL or MongoDB or other (this isn't decided)

And here are some basic ideas that I've come up with.

Features:
Username/Password Database storage: SQL will work, we'll see what we learn about MongoDB in upcoming lectures
Internet browser access: Write an interface to access accounts through web browsers
*Update account script: Idea for an automatic updater (dropbox can always be running and updates directories immediately) (optional)
Read/Write permissions for other users
Student/Teacher accounts: Teachers need a database for students (to distribute documents), and likely the reverse (students may need to know which teachers to pull documents from)
Submission history: Keep track of previous versions of the file

