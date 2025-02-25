# Vertica DevOps Candidate Case

**DISCLAIMER: This is a hiring case and not a real Vertica project.**

## Introduction
Welcome to our DevOps case!
We specialize in building large e-commerce solutions, but we have started completely off-track.
Right now, our server is running on a dusty laptop under a desk, and Black Friday is just around the corner!
In a panic, we attempted to fix this with a Terraform script to migrate everything to the cloud.
We also created a small program to check how stable (or unstable) the solution is.
The problem? Everything looks totally chaotic… Help us save the day!

## Task
We’d like you to take a look at the solution and send it back once you believe it meets the structure, coding style, quality, and best practices you consider necessary.
In other words: There’s no right or wrong answer here. Review the parts that make sense to improve—there are no limits and no fixed expectations.

We don’t expect you to spend an excessive amount of time understanding the task or delivering a perfect—or even a fully working—solution.
The repository contains several different components, and you are free to focus on just one of them. There is no requirement to cover everything.

If there are aspects you don’t address, feel free to note them down so we can discuss them during the interview.
While we have included specific technologies, you are welcome to use whatever tools and approaches you feel most comfortable with.

## Technologies
This project consists of several components, each requiring specific technologies:

```
root/
├── .github/ (CI-related configurations)
├── iac/ (requires Terraform)
│   └── terraform files
├── healthcheck/ (requires Go)
│   └── go files
├── scripts/ (requires a UNIX-like environment)
│   └── script files
├── other root files 
└── README.md
```

### Installation Requirements
- **Terraform**: [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- **Go**: [Install Go](https://go.dev/doc/install)
- **UNIX-like environment**: The scripts in the `scripts/` folder use `#!/bin/bash`, which requires a UNIX-like shell (Linux, macOS, or Windows with WSL/Git Bash).

## Setup
We have created a small guide on how to get started with our solution.
We want the solution to be in a private repository, so we’ve provided a guide on creating a new repository.

### Clone

**We’ve provided a specific guide to ensure you don’t fork the repository and accidentally make your solution public.**

Clone this repository and change the remote to your own repository.

```bash
git clone https://github.com/vertica-as/devops-candidate-case.git
```

### Create Your Own Repository

Create a new repository on GitHub or use GitHub CLI to create a new repository.

1. **Install GitHub CLI**: Ensure that `gh` is installed on your computer. You can install it via:
   - macOS: `brew install gh`
   - Linux: Install `gh` using your package manager
   - Windows: Use Chocolatey (`choco install gh`) or download it from GitHub’s website.
2. **Authenticate Your Account**: Log in to GitHub via `gh` using the command:
   ```bash
   gh auth login
   ```
   Follow the instructions to authenticate with a browser or a personal access token (PAT).

```bash
gh repo create vertica-devops-candidate-case --private --description "Vertica DevOps candidate case" --confirm
```

### Change the remote URL of the `devops-candidate-case` repo you just cloned

```bash
cd devops-candidate-case
git remote set-url origin https://github.com/[your-username]/vertica-devops-candidate-case.git
```

## Handover
Add `@martinmose` and `@cbruun` to your repository so we can review your solution.

```bash
gh repo collaborate --add martinmose --permission pull --repo [your-username]/vertica-devops-candidate-case
gh repo collaborate --add cbruun --permission pull --repo [your-username]/vertica-devops-candidate-case
```
