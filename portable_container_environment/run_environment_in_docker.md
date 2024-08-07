When creating an environment to run your code on the server, you might run into people less than enthusiastic (for very good reason) 
to let you stick thousands of files on their server. 
One solution is to create a docker image of your environment so that the safety people can approve a single binary instead.

Adjust the attacker Dockerfile (name of requirements file, add the extensions folder with the .vsix files to get the python, debugger, docker and DevContainers installed automatically on the vscode-server, although you might not need the docker and DevContainers since the server is already running inside the container)

Create the image: docker build -t image_name .

Save the image to disc: docker save -o new_name_can_be_same_as_before.tar image_name

Once you have the tarball on the server load the image: docker load -i image_name.tar

Then run the container with volume mount: 
docker run -d -p 8080:8080 -v C:\Users\<YourUsername>\my-project:/workspace --name vscode-dev-container my-vscode-dev-env

open a browser window at localhost:8080 to get the vscode installation

to use the virtual environment you installed, go to the Python: select interpreter option in the search bar and use "Enter interpreter path" to find the installation (in this case it's ../workspace/venv/python)


