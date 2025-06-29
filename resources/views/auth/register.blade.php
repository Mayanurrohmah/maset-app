<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Smart Food Recommendation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f4f4f4;
        }

        .register-box {
            background: #fff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .register-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 18px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            transition: all 0.3s;
        }

        input:focus {
            border-color: #6ECB63;
            outline: none;
            background: #f9fff9;
        }

        .btn-register {
            width: 100%;
            padding: 12px;
            background: #6ECB63;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-register:hover {
            background: #57a94f;
        }

        .login-link {
            margin-top: 10px;
            text-align: center;
            font-size: 14px;
        }

        .login-link a {
            color: #6ECB63;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="register-box">
        <h2>Register</h2>

        <form method="POST" action="{{ route('register') }}">
            @csrf

            <div class="form-group">
                <input type="text" name="name" placeholder="Username" required>
            </div>

            <div class="form-group">
                <input type="email" name="email" placeholder="Email" required>
            </div>

            <div class="form-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>

            <div class="form-group">
                <input type="password" name="password_confirmation" placeholder="Confirm Password" required>
            </div>

            <button type="submit" class="btn-register">Register</button>

            <div class="login-link">
                Sudah punya akun? <a href="{{ route('login') }}">Login</a>
            </div>
        </form>
    </div>

</body>
</html>
