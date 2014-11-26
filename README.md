# Gdrive-docker
-------------
Want to back up files to your google drive, but don't want to install lots
of strange stuff on your machine? No worries, you can use Gdrive-docker!

Basically we put the [drive tool](https://github.com/rakyll/drive) inside the
docker container, and run it in there.

The main advantage here is that you don't have to install anything on your
machine besides docker.

## Requirements:

You need to have Docker installed.

## Usage

Building the images (You do this only once):

	sudo ./build_images

Set your google credentials: (You do this only once):

	sudo ./set_cred

When you run this command, the container' shell will give you a URL to follow.
Follow it (Paste it in your browser) to get a code from google, and then paste
it back into the terminal. At this point your credentials are set.

### Storing a file

To store the file /path/to/my/file/on/host at location /some/path/on/gdrive at
your google drive, run the following command:

	sudo ./store_file /path/to/my/file/on/host /some/path/on/gdrive

Congratulations, you stored a file on your google drive.

## Known issues

You can not store a file to a location that is not present at the Google
drive's side. As an example, if you want to store a file to location /a/b/c
inside google drive, and the folders b and c do not exist, you will not be able
to store the file /a/b/c/my_file.txt. You have to make sure somehow that the
path /a/b/c exists before trying to save my_file.txt to that path.
