<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 230px;
            background-color: #6ECB63;
            padding: 20px;
            color: white;
        }

        .sidebar h2 {
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            margin: 20px 0;
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .sidebar a:hover {
            text-decoration: underline;
        }

        .content {
            flex: 1;
            padding: 30px;
            background: #f5f5f5;
        }

        .cards {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
        }

        .card {
            background: #6ECB63;
            color: white;
            padding: 20px;
            border-radius: 10px;
            flex: 1;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card img {
            width: 30px;
            height: 30px;
        }

        .chart {
            display: flex;
            justify-content: center;
        }

        .chart img {
            width: 50%;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Hallo Admin</h2>
        <a href="#">Kelola Data Makanan</a>
        <a href="#">Aktivitas Pengguna</a>
        <a href="{{ route('logout') }}">Logout</a>
    </div>

    <div class="content">
        <div class="cards">
            <div class="card">
                <img src="{{ asset('img/user.png') }}" alt="User">
                <div>
                    <strong>Total Pengguna</strong><br>50
                </div>
            </div>
            <div class="card">
                <img src="{{ asset('img/food.png') }}" alt="Food">
                <div>
                    <strong>Data Makanan</strong><br>1000
                </div>
            </div>
            <div class="card">
                <img src="{{ asset('img/act.png') }}" alt="Activity">
                <div>
                    <strong>Aktivitas Pengguna</strong><br>10
                </div>
            </div>
        </div>

        <div class="chart">
            <img src="{{ asset('img/chart.png') }}" alt="Chart">
        </div>
    </div>
</body>
</html>

