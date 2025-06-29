<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart Food Recommendation</title>
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

        .container {
            display: flex;
            flex-wrap: wrap;
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            max-width: 900px;
            width: 100%;
        }

        .left {
            background-color: #6ECB63;
            flex: 1;
            min-width: 300px;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .left img {
            width: 180px;
            margin-bottom: 20px;
            border-radius: 50%;
            transition: transform 0.3s ease;
        }

        .left img:hover {
            transform: scale(1.05);
        }

        .right {
            flex: 1;
            min-width: 300px;
            padding: 40px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

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

        .form-group input[type="checkbox"] {
            margin-right: 6px;
        }

        .btn-login {
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

        .btn-login:hover {
            background: #57a94f;
        }

        .register-link {
            margin-top: 10px;
            text-align: center;
            font-size: 14px;
        }

        .register-link a {
            color: #6ECB63;
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left, .right {
                width: 100%;
            }

            .left img {
                width: 140px;
            }
        }

    </style>
</head>
<body>

    <div class="container">
        <div class="left">
            <img src="{{ asset('img/login1.png') }}" alt="Ilustrasi">
            <p style="font-size: 16px; text-align: center; font-weight: 500;">Smart Food Recommendations<br>Fit Your Life</p>
        </div>

        <div class="right">
            <div class="login-box">
                <h2>Login</h2>

                <form method="POST" action="{{ route('login') }}">
                    @csrf

                    <div class="form-group">
                        <input type="email" name="email" placeholder="Email" required autofocus>
                    </div>

                    <div class="form-group">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>

                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="remember"> Remember me
                        </label>
                    </div>

                    <button type="submit" class="btn-login">Login</button>

                    <div class="register-link">
                        Belum punya akun? <a href="{{ route('register') }}">Register</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
