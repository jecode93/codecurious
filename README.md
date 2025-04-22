# 🧠 CodeCurious – A Personal Coding Journal

**Answers to My Coding Curiosities**

Welcome to my personal coding journal!
Here, I share answers to the questions I’ve faced on my coding journey. It’s my way of keeping track of lessons learned,
and I hope it becomes a helpful guide for beginners and curious coders alike.

## 🔒 Notice

> ⚠️ This project is shared for personal reference and inspiration only.  
> Copying, redistributing, or reusing any part of this codebase is **strictly prohibited** without the author's written
> permission.

© Jean Emmanuel Cadet — All rights reserved.

### 🖥️ Built With

- Ruby on Rails
- Hotwire (Turbo + Stimulus)
- SQLite
- Tailwind CSS

### 📚 Getting Started

To get a local copy up and running, you can follow these simple example steps:

### ✅ Prerequisites

- Visual Studio Code must be installed on your computer | Download Visual Studio
  Code [VSCode](https://code.visualstudio.com/)
- Git must be installed on your computer | Download [Git](https://git-scm.com/downloads)
- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- Install [Ruby on Rails](https://guides.rubyonrails.org/install_ruby_on_rails.html)

### 💻 Setup

- Clone the repository using

```sh
  git clone https://github.com/jecode93/codecurious.git
```

- Open the project folder in Visual Studio Code or your text editor of choice
- Then run

```sh
  bundle install
```

### ✨ Features

- Blog-style journal to share code-related answers
- Categorization and filtering by topic
- Admin dashboard for post and user management
- Real-time interactions with Turbo
- Custom domain support (`lvh.me`)

### 👨‍💻 Usage

To run the project, if it exists, copy the `.env.example` file to a `.env` file that you create and fill in the
necessary
values, after that run the following command:

```sh
  bin/setup
```

Then run

```sh
  bin/dev
```

And navigate to the provided URL (Don't forget to verify your port)

**To create an admin account:**  
Run `rails console` and enter:

```ruby
Admin.create!(email: 'admin@example.com', password: 'securepassword')
```

Then visit http://admin.lvh.me:3000 and log in.

**Important:**

```sh
  Public link
    - http://lvh.me:3000

  Admin Dashboard
    - http://admin.lvh.me:3000
```

### 🚀 Deployment

You can deploy this project using:

- [Digital Ocean](https://www.digitalocean.com/)
- [Fly.io](https://fly.io/)
- [Heroku](https://www.heroku.com/)
- [Render](https://render.com/)

### Authors

👤 **Jean Emmanuel Cadet**

- GitHub: [@jecode93](https://github.com/jecode93)
- LinkedIn: [jean-emmanuel-cadet](https://www.linkedin.com/in/jean-emmanuel-cadet/)
- Facebook: [@jecode93](https://www.facebook.com/jecode93)
- Instagram: [@jecode93](https://instagram.com/jecode93)
- Twitter: [@jecode93](https://twitter.com/jecode93)

### 🔭 Future Features <a name="future-features"></a>

- [ ] Real-Time Interactions with Turbo (Coming soon)

### 🛡 Custom License

This project is not open source and is provided under a custom license.
All rights are reserved by the author.
See the [LICENSE](./LICENSE) file for details.