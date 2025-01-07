# First Steps: Setting Up GitHub Repository with SSH

Becuase I ran into some issues when first configuring the remote access to the repository I decided to also include this to keep track of the troubleshooting steps I took.

---

## 1. Generate an SSH Key
1. Check if you already have an SSH key:
   ```bash
   ls ~/.ssh

2. Generate the key if needed
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

3. Add the SSH key to the SSH agent:
  ```bash
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
```


## 2. Add the key to GitHub:
1. Copy your public key:
  ```bash
    cat ~/.ssh/id_rsa.pub
   ```

2. Add the key to GitHub
   - Go to Settings > SSH and GPG Keys > New SSH Key.
   - Paste the copied key and give it a title (e.g., "Home Lab PC").


 ## 3. Link Local Project to GitHub Repository
 1. Add the SSH URL of your repository:
  ```bash
    git remote add origin git@github.com:username/repository-name.git
  ```
  ***This was my mistake, I was using the https link instead of code>SSH on GitHub***
  
  
  2. Verify the remote link:
  ```bash
     git remote -v
   ```

## 4. Troubleshooting
- If prompted for a username/password, update the remote URL to use SSH:
 ```bash
  git remote set-url origin git@github.com:username/repository-name.git
 ```  

  
  




