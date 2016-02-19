# Building a Ceylon APT repository

The following images/tags are available:

 - `latest` ([ceylon-repo-deb/Dockerfile](https://github.com/ceylon-docker/ceylon-repo-deb/blob/master/Dockerfile))

To run the build perform the following steps:

 1. First make sure you have built the [Ceylon DEB package](https://hub.docker.com/r/ceylon/ceylon-package-deb/). The name of the resulting DEB file will be `ceylon-VERSION_VERSION_all.deb` where `VERSION` is a number that will be used as an argument in step 3.
 2. `docker pull ceylon/ceylon-repo-deb:latest`
 3. `docker run -t --rm -v /tmp/ceylon:/output -v ~/.gnupg:/home/ceylon/.gnupg ceylon/ceylon-repo-deb:latest <VERSION>`

The Docker image can't contain any sensitive information of course, so for the purpose of signing the packages you can point Docker to your own GnuPG key ring in your home or any other directory. That's the purpose of the `-v ~/.gnupg:/home/ceylon/.gnupg` volume.

If the build completed successfully the resulting APT repository can be found in `/tmp/ceylon/db`, `/tmp/ceylon/dists` and `/tmp/ceylon/pool`.

NB: The `/tmp/ceylon` folder used in the example can be any folder but you *have* to use it's full path in the command and it must contain the result that was obtained by running the build for the  [Ceylon DEB package](https://hub.docker.com/r/ceylon/ceylon-package-deb/) first!
