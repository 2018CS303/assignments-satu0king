# Assignment 2_1 - Jenkins

## Setting up Blue Ocean
- Go to  `Manage Jenkins > Manage Plugins`.
- Choose the `Available` tab and search for `blue ocean`.
- Select the `Blue Ocean (BlueOcean Aggregator)` plugin.
- You can view BlueOcean UI by clicking the link from the left menu. Blue Ocean will be activated when Jenkins restarts.

## Using a pivate GitHub Repository

- Create a new freestyle project.
- Under `Source Code Management` select `Git`.
- Add the private repository's URL in the `Repository URL` text box.
- We need to add credentials, so that jenkins can access the private repo. Click `Add`
button in the `Credntial` text box.
- Chose `Jenkins` as the credential provider.
- Chose the preferred authentication method and provide the credentials.
- For example, in `Username with Password` method, you need to write your GitHub username and password.
- After adding your credentials choose the newly added credentials in the
dropdown menu that appears next to `Credentials` label.
- Now Jenkins can access your private repository

## Using Git SCM Poll

### Configuring Jenkins
- In the configuration page of the project, set build triggers to `GitHub hook trigger for GITScm polling`

### Adding Jenkins webhook to GitHub
Now we need to set up our GitHub repo to make a request to Jenkins webhook so
that the polling logic can be applied.
- Go to GitHub repo and navigate to `Settings`.
- Choose `Webhooks` from the submenu.
- Add `http://<public-ip or URL>/github-webhook` under `Jenkins hook url`.
- Now GitHub is cofigured to send a request when a commit is made

## Post Build Actions - Extended Email Notification
Given below, are the steps to setup email notifications in Jenkins.
The notifications will be sent after every build action.  

### Configuring Email
We need to first provide the SMTP credentials, so that Jenkins can send mails

- Go to `Manage Jenkins > Configure Systems` and scroll down to the `Extended
E-mail Notification` section.
- Add the SMTP server details e.g. `smtp.gmail.com`.
- Click on the `Advanced` button to provide credentials of the mail account used to send mails.
- Select `Use SMTP Authentication`.
- Enter the account username and password.
- Select `Use SSL` and specify the `SMTP port`
- Select `Allow sending to unregistered users` if mail should be sent to
non-Jenkins users.
- With this the basic email configuration is complete.

### Adding the post build action
- Go to `Post-build Actions` section in the `Configuration` page of project.
- Click on `Add post-build action` and choose `Email Notification`
- The options can be used for project based customizations of the email notification.

With this the Post build action for extended email notification is complete.
