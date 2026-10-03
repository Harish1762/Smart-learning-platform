# 🎓 Smart Student Learning Portal

<div align="center">

![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.3-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Gemini](https://img.shields.io/badge/Google_Gemini-AI-4285F4?style=for-the-badge&logo=google&logoColor=white)
![Cloudinary](https://img.shields.io/badge/Cloudinary-CDN-3448C5?style=for-the-badge&logo=cloudinary&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A modern, AI-powered learning platform with RAG-based document Q&A**

[Live Demo](#) · [API Docs](#api-documentation) · [Installation](#installation) · [Architecture](#architecture)

</div>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [API Documentation](#api-documentation)
- [RAG Pipeline](#rag-pipeline)
- [Security](#security)
- [Testing](#testing)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)

---

## 🌟 Overview

Smart Student Learning Portal is an enterprise-grade full-stack learning management system that combines traditional course management with cutting-edge AI capabilities. Students can upload their study documents and ask questions using a RAG (Retrieval-Augmented Generation) pipeline powered by Google Gemini, receiving accurate, context-aware answers with source citations.

### Key Highlights
- **AI-Powered Q&A**: Upload PDFs/DOCX files and ask questions — get answers grounded in your documents
- **Smart Document Processing**: Automatic text extraction, chunking, and embedding generation
- **Conversation Memory**: The AI remembers previous questions in a session for contextual follow-ups
- **Source Citations**: Every AI answer includes references to the specific document sections used
- **Role-Based Access**: Separate student and admin experiences
- **Modern UI**: Glassmorphism design with dark/light mode support

---

## ✨ Features

### For Students
| Feature | Description |
|---------|-------------|
| 📚 Course Enrollment | Browse, search, and enroll in courses |
| 📄 Document Upload | Upload PDF and DOCX study materials |
| 🤖 AI Chat | Ask questions about uploaded documents |
| 📊 Dashboard | Track progress, view enrolled courses, recent activity |
| 👤 Profile Management | Update profile, change password, view activity history |

### For Administrators
| Feature | Description |
|---------|-------------|
| 📋 Course Management | Create, update, delete courses |
| 👥 User Management | View users, toggle account status |
| 📈 Analytics Dashboard | Platform statistics, enrollment trends |
| 📊 Activity Monitoring | View system-wide activity logs |

### Technical Features
| Feature | Description |
|---------|-------------|
| 🔐 JWT Authentication | Access + Refresh token rotation |
| 🛡️ Spring Security | Role-based access control |
| ☁️ Cloudinary Integration | Cloud file storage and CDN delivery |
| 📧 Email Notifications | Welcome emails via Gmail SMTP |
| 🧠 RAG Pipeline | Document → Chunks → Embeddings → Retrieval → Generation |
| 🎨 Glassmorphism UI | Modern, responsive design with dark/light mode |

---

## 🛠️ Tech Stack

### Frontend
- **HTML5** — Semantic markup
- **CSS3** — Custom properties, Flexbox, Grid, Glassmorphism
- **JavaScript (ES6+)** — Vanilla JS, Fetch API, ES Modules
- **Chart.js** — Dashboard analytics charts

### Backend
- **Java 21** — Latest LTS features
- **Spring Boot 3.3** — Auto-configuration, embedded Tomcat
- **Spring Security** — JWT authentication, method security
- **Spring Data JPA** — Hibernate ORM
- **Spring Mail** — Email sending
- **Maven** — Dependency management and build

### Database
- **MySQL 8.0** — Relational database with full normalization

### AI / RAG
- **Google Gemini API** — Text generation (gemini-2.0-flash)
- **Gemini Embeddings** — text-embedding-004 (768 dimensions)
- **Apache PDFBox** — PDF text extraction
- **Apache POI** — DOCX text extraction

### Cloud Services
- **Cloudinary** — File upload, storage, and CDN
- **Gmail SMTP** — Transactional emails

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    CLIENT (Browser)                      │
│          HTML5 + CSS3 + Vanilla JavaScript               │
└─────────────────────┬───────────────────────────────────┘
                      │ HTTPS / REST API
┌─────────────────────▼───────────────────────────────────┐
│                 SPRING BOOT APPLICATION                   │
│  ┌──────────┐  ┌──────────┐  ┌────────────────────┐     │
│  │ Security │  │Controllers│  │  Global Exception  │     │
│  │  (JWT)   │  │  (REST)   │  │     Handler        │     │
│  └────┬─────┘  └─────┬─────┘  └────────────────────┘     │
│       │              │                                    │
│  ┌────▼──────────────▼────────────────────────────┐      │
│  │              SERVICE LAYER                      │      │
│  │  Auth │ User │ Course │ Document │ Chat │ RAG   │      │
│  └────────────────────┬───────────────────────────┘      │
│                       │                                   │
│  ┌────────────────────▼───────────────────────────┐      │
│  │            REPOSITORY LAYER (JPA)               │      │
│  └────────────────────┬───────────────────────────┘      │
└───────────────────────┼──────────────────────────────────┘
                        │
        ┌───────────────┼────────────────┐
        ▼               ▼                ▼
   ┌─────────┐   ┌───────────┐   ┌────────────┐
   │  MySQL   │   │Cloudinary │   │Google Gemini│
   │ Database │   │   CDN     │   │    API      │
   └──────────┘   └───────────┘   └────────────┘
```

---

## 📁 Project Structure

```
SmartLearningPortal/
│
├── frontend/                          # Frontend application
│   ├── index.html                     # Landing page
│   ├── login.html                     # Login page
│   ├── register.html                  # Registration page
│   ├── dashboard.html                 # Student dashboard
│   ├── admin.html                     # Admin dashboard
│   ├── courses.html                   # Course catalog
│   ├── upload.html                    # Document upload
│   ├── chat.html                      # AI chat interface
│   ├── profile.html                   # User profile
│   ├── css/
│   │   ├── variables.css              # CSS custom properties
│   │   ├── base.css                   # Reset and base styles
│   │   ├── components.css             # Reusable components
│   │   ├── layout.css                 # Layout (sidebar, grid)
│   │   ├── animations.css             # Keyframes and transitions
│   │   └── responsive.css             # Media queries
│   ├── js/
│   │   ├── config.js                  # App configuration
│   │   ├── api.js                     # HTTP client
│   │   ├── auth.js                    # Authentication
│   │   ├── theme.js                   # Dark/light mode
│   │   ├── toast.js                   # Toast notifications
│   │   ├── utils.js                   # Utility functions
│   │   └── sidebar.js                 # Sidebar navigation
│   ├── components/
│   │   ├── chart-setup.js             # Chart.js setup
│   │   └── modal.js                   # Modal dialogs
│   └── assets/                        # Images, icons
│
├── backend/                           # Spring Boot application
│   ├── pom.xml                        # Maven dependencies
│   └── src/
│       ├── main/
│       │   ├── java/com/smartlearning/
│       │   │   ├── SmartLearningApplication.java
│       │   │   ├── controller/        # REST controllers
│       │   │   ├── service/           # Business logic interfaces
│       │   │   │   └── impl/          # Service implementations
│       │   │   ├── repository/        # JPA repositories
│       │   │   ├── entity/            # JPA entities
│       │   │   ├── dto/
│       │   │   │   ├── request/       # Request DTOs
│       │   │   │   └── response/      # Response DTOs
│       │   │   ├── config/            # Configuration beans
│       │   │   ├── security/          # JWT, Spring Security
│       │   │   ├── exception/         # Custom exceptions
│       │   │   ├── util/              # Utility classes
│       │   │   └── rag/               # RAG pipeline
│       │   └── resources/
│       │       └── application.properties
│       └── test/                      # Test classes
│
├── database/
│   ├── schema.sql                     # Database schema
│   ├── sample_data.sql                # Sample data
│   └── migrations/                    # Migration scripts
│
├── docs/                              # Documentation
├── .env.example                       # Environment template
├── .gitignore                         # Git ignore rules
└── README.md                          # This file
```

---

## 🚀 Installation

### Prerequisites

| Software | Version | Download |
|----------|---------|----------|
| Java JDK | 21+ | [Download](https://adoptium.net/) |
| Maven | 3.9+ | [Download](https://maven.apache.org/) |
| MySQL | 8.0+ | [Download](https://dev.mysql.com/downloads/) |
| Git | Latest | [Download](https://git-scm.com/) |

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/SmartLearningPortal.git
cd SmartLearningPortal
```

### Step 2: Set Up Environment Variables

```bash
cp .env.example .env
# Edit .env with your actual credentials
```

### Step 3: Set Up the Database

```bash
# Login to MySQL
mysql -u root -p

# Run the schema
source database/schema.sql;

# Load sample data
source database/sample_data.sql;
```

### Step 4: Configure API Keys

1. **Cloudinary**: Sign up at [cloudinary.com](https://cloudinary.com) → Dashboard → Copy cloud name, API key, API secret
2. **Google Gemini**: Visit [ai.google.dev](https://ai.google.dev) → Get API Key
3. **Gmail SMTP**: Enable [App Passwords](https://myaccount.google.com/apppasswords) in Google Account

### Step 5: Update Application Properties

Edit `backend/src/main/resources/application.properties` with your credentials, or set them as environment variables.

### Step 6: Build and Run

```bash
cd backend
mvn clean install
mvn spring-boot:run
```

The API will be available at `http://localhost:8080`

### Step 7: Open Frontend

Open `frontend/index.html` in a browser, or use Live Server (VS Code extension) for development:
- Install "Live Server" extension in VS Code
- Right-click `index.html` → "Open with Live Server"
- Frontend will be at `http://localhost:5500`

---

## ⚙️ Configuration

### Required Environment Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `DB_HOST` | MySQL host | `localhost` |
| `DB_PORT` | MySQL port | `3306` |
| `DB_NAME` | Database name | `smart_learning_portal` |
| `DB_USERNAME` | MySQL username | `root` |
| `DB_PASSWORD` | MySQL password | `your_password` |
| `JWT_SECRET` | JWT signing secret (64+ chars) | `long-random-string` |
| `CLOUDINARY_CLOUD_NAME` | Cloudinary cloud name | `dxxxxxxx` |
| `CLOUDINARY_API_KEY` | Cloudinary API key | `123456789` |
| `CLOUDINARY_API_SECRET` | Cloudinary API secret | `abcdef123` |
| `GEMINI_API_KEY` | Google Gemini API key | `AIza...` |
| `MAIL_USERNAME` | Gmail address | `you@gmail.com` |
| `MAIL_PASSWORD` | Gmail app password | `xxxx xxxx xxxx xxxx` |

---

## 🗄️ Database Setup

### Schema Overview

| Table | Description | Records |
|-------|-------------|---------|
| `users` | User accounts | 5 |
| `roles` | Application roles | 2 |
| `user_roles` | User-role mapping | 6 |
| `courses` | Course catalog | 8 |
| `enrollments` | Course enrollments | 12 |
| `documents` | Uploaded files | - |
| `document_chunks` | Text chunks for RAG | - |
| `embeddings_metadata` | Embedding vectors | - |
| `chat_history` | AI conversation logs | - |
| `activity_logs` | User activity audit | 10 |
| `refresh_tokens` | JWT refresh tokens | - |

### Default Accounts

| Email | Password | Role |
|-------|----------|------|
| `admin@smartlearning.com` | `Password@123` | Admin + Student |
| `john.doe@student.com` | `Password@123` | Student |
| `jane.smith@student.com` | `Password@123` | Student |

---

## 📡 API Documentation

### Authentication

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| `POST` | `/api/auth/register` | Register new user | No |
| `POST` | `/api/auth/login` | Login | No |
| `POST` | `/api/auth/refresh` | Refresh access token | No |
| `POST` | `/api/auth/logout` | Logout | Yes |

### Users

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| `GET` | `/api/users/profile` | Get profile | Yes |
| `PUT` | `/api/users/profile` | Update profile | Yes |
| `PUT` | `/api/users/change-password` | Change password | Yes |
| `GET` | `/api/users/activities` | Activity history | Yes |

### Courses

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| `GET` | `/api/courses` | List courses (paginated) | Yes |
| `GET` | `/api/courses/{id}` | Get course details | Yes |
| `POST` | `/api/courses` | Create course | Admin |
| `PUT` | `/api/courses/{id}` | Update course | Admin |
| `DELETE` | `/api/courses/{id}` | Delete course | Admin |
| `POST` | `/api/courses/{id}/enroll` | Enroll in course | Yes |
| `GET` | `/api/courses/enrollments` | My enrollments | Yes |

### Documents

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| `POST` | `/api/documents/upload` | Upload document | Yes |
| `GET` | `/api/documents` | List my documents | Yes |
| `GET` | `/api/documents/{id}` | Get document details | Yes |
| `DELETE` | `/api/documents/{id}` | Delete document | Yes |

### AI Chat

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| `POST` | `/api/ai/chat` | Send chat message | Yes |
| `GET` | `/api/ai/chat/history/{sessionId}` | Get session history | Yes |
| `GET` | `/api/ai/chat/sessions` | List chat sessions | Yes |
| `DELETE` | `/api/ai/chat/sessions/{sessionId}` | Delete session | Yes |

### Admin

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| `GET` | `/api/admin/dashboard` | Platform stats | Admin |
| `GET` | `/api/admin/users` | List all users | Admin |
| `PUT` | `/api/admin/users/{id}/toggle-status` | Toggle user status | Admin |

### Example: Login Request/Response

**Request:**
```json
POST /api/auth/login
Content-Type: application/json

{
    "email": "john.doe@student.com",
    "password": "Password@123"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Login successful",
    "data": {
        "accessToken": "eyJhbGciOiJIUzI1...",
        "refreshToken": "eyJhbGciOiJIUzI1...",
        "tokenType": "Bearer",
        "user": {
            "id": 2,
            "email": "john.doe@student.com",
            "fullName": "John Doe",
            "roles": ["ROLE_STUDENT"]
        }
    }
}
```

### Example: AI Chat Request/Response

**Request:**
```json
POST /api/ai/chat
Authorization: Bearer eyJhbG...
Content-Type: application/json

{
    "message": "What is backpropagation?",
    "documentId": 1,
    "sessionId": "sess-abc123"
}
```

**Response:**
```json
{
    "success": true,
    "data": {
        "response": "Based on the uploaded document, backpropagation is an algorithm used for training neural networks...",
        "sources": [
            {
                "chunkIndex": 3,
                "content": "...relevant excerpt...",
                "page": 12
            }
        ],
        "sessionId": "sess-abc123",
        "tokensUsed": 450,
        "responseTimeMs": 1200
    }
}
```

---

## 🧠 RAG Pipeline

### How It Works

```
1. UPLOAD → User uploads PDF/DOCX
2. EXTRACT → PDFBox/POI extracts raw text
3. CLEAN → Remove noise, normalize whitespace
4. CHUNK → Split into ~500 token chunks with 50-token overlap
5. EMBED → Generate 768-dim vectors via Gemini Embeddings API
6. STORE → Save chunks + embeddings in MySQL
7. QUERY → User asks a question
8. EMBED QUERY → Generate embedding for the question
9. RETRIEVE → Find top-5 similar chunks via cosine similarity
10. PROMPT → Build context-aware prompt with conversation memory
11. GENERATE → Send to Gemini 2.0 Flash for answer
12. CITE → Attach source chunk references
13. RESPOND → Return answer with citations
```

### Prompt Template

```
You are a helpful study assistant. Answer the student's question using ONLY
the provided document context. If the answer cannot be found in the context,
clearly state: "I couldn't find this information in the uploaded documents."

Always cite which section/chunk your answer comes from.

Document Context:
[Chunk 1] (Page 5-6): "..."
[Chunk 2] (Page 12): "..."
...

Previous Conversation:
User: ...
Assistant: ...

Current Question: {user_question}
```

---

## 🔐 Security

| Feature | Implementation |
|---------|---------------|
| Password Hashing | BCrypt (strength 10) |
| Authentication | JWT (Access + Refresh tokens) |
| Access Token Expiry | 15 minutes |
| Refresh Token Expiry | 7 days |
| Authorization | Role-based (STUDENT, ADMIN) |
| CORS | Configured for frontend origin |
| Input Validation | Jakarta Bean Validation |
| SQL Injection | Parameterized queries (JPA) |
| XSS | HTML escaping in frontend |
| CSRF | Disabled (stateless JWT) |
| Secure Headers | Spring Security defaults |

---

## 🧪 Testing

### Running Tests

```bash
cd backend
mvn test
```

### Manual Testing Checklist

- [ ] Register a new user
- [ ] Login and receive JWT tokens
- [ ] Access profile with valid token
- [ ] Get 401 with expired/invalid token
- [ ] Refresh token flow
- [ ] Create course (admin)
- [ ] Enroll in course (student)
- [ ] Upload PDF document
- [ ] Upload DOCX document
- [ ] Verify document processing completes
- [ ] Ask AI question about document
- [ ] Verify source citations in response
- [ ] Test conversation memory
- [ ] Test dark/light mode toggle
- [ ] Test responsive design on mobile
- [ ] Test role-based access control

---

## 🚢 Deployment

### Frontend Deployment (Netlify)

1. Push `frontend/` to a GitHub repository
2. Connect to [Netlify](https://netlify.com)
3. Set publish directory to `frontend/`
4. Update `API_BASE_URL` in `js/config.js` to your backend URL

### Backend Deployment (Railway)

1. Create a [Railway](https://railway.app) account
2. New Project → Deploy from GitHub
3. Set root directory to `backend/`
4. Add environment variables (see Configuration section)
5. Railway auto-detects Maven and builds

### Database (Railway MySQL)

1. In Railway project → Add MySQL plugin
2. Copy connection details to environment variables
3. Run `schema.sql` and `sample_data.sql` via MySQL CLI

---

## 🔧 Troubleshooting

| Issue | Solution |
|-------|----------|
| `Connection refused` MySQL | Ensure MySQL is running: `sudo systemctl start mysql` |
| `JWT signature invalid` | Check JWT_SECRET matches in .env |
| `Cloudinary upload fails` | Verify cloud_name, api_key, api_secret |
| `Gemini API 429` | Rate limit exceeded — wait or upgrade API plan |
| `Document processing stuck` | Check logs for extraction errors, verify file format |
| `CORS errors` | Update FRONTEND_URL in application.properties |
| `403 Forbidden` | Check user role matches required endpoint role |
| `File too large` | Default limit is 10MB — adjust in properties |

---

## 🔮 Future Improvements

- [ ] WebSocket for real-time chat
- [ ] Redis caching for frequently accessed data
- [ ] Vector database (Pinecone/Weaviate) for scalable embeddings
- [ ] OAuth2 social login (Google, GitHub)
- [ ] Quiz generation from documents
- [ ] Collaborative notes
- [ ] Video lecture support
- [ ] Mobile app (React Native)
- [ ] Kubernetes deployment
- [ ] CI/CD pipeline (GitHub Actions)
- [ ] Performance monitoring (Prometheus + Grafana)
- [ ] Multi-language support (i18n)

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Built with ❤️ for B.Tech CSE (Artificial Intelligence)**

*Demonstrating expertise in Java Spring Boot, SQL, REST APIs, JWT Security, RAG-based AI, Cloud Integration, and Modern Frontend Development*

</div>
