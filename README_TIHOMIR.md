Workflow labels are created - **Build, Test, Deploy**. On Pull request from **tihomirIliev-patch-1** to **master** branch with label selected the following actions are triggered:<br><br>
**Build** - Docker image is build from the Dockerfile and pushed to Docker Hub.<br><br>
**Test** - The image with tag devnet_hardhat is runned and hardhat tests are triggered on it.<br><br>
**Deploy** - Docker compose is used to run the image created in build. Test smart contract is deployed on the devnet. New image from the running container is build with tag - **devnet_hardhat**<br><br>

Increment the Counter value by one to simulate change so pull request can be available.<br><br>
Counter 10

