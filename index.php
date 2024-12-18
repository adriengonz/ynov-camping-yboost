<?php
$hour = date('G');
$gradient = '';

if ($hour >= 6 && $hour < 12) {
    // Morning
    $gradient = 'linear-gradient(to bottom, #87CEEB, #FFFFFF)';
} elseif ($hour >= 12 && $hour < 18) {
    // Afternoon
    $gradient = 'linear-gradient(to bottom, #00BFFF, #FFFFFF)';
} elseif ($hour >= 18 && $hour < 20) {
    // Evening
    $gradient = 'linear-gradient(to bottom, #1E90FF, #FFFFFF)';
} else {
    // Night
    $gradient = 'linear-gradient(to bottom, #191970, #000000)';
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Météo</title>
    <link rel="stylesheet" href="/css/styles.css">
    <style>
        body {
            background: <?php echo $gradient; ?>;
        }
    </style>
</head>
<body>
    <div class="stars">
        <?php for ($i = 0; $i < 100; $i++): ?>
            <div class="star" style="top: <?php echo rand(0, 100); ?>vh; left: <?php echo rand(0, 100); ?>vw;"></div>
        <?php endfor; ?>
    </div>
    <h1>Météo</h1>
    <div class="search-bar">
        <input type="text" placeholder="Rechercher...">
        <button id="getJoke">Get a joke</button>
        <p id="joke"></p>
    </div>
    <script>
        document.getElementById('getJoke').addEventListener('click', function() {
            fetch('https://api.chucknorris.io/jokes/random')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('joke').textContent = data.value;
                })
                .catch(error => {
                    document.getElementById('joke').textContent = 'Failed to fetch a joke. Please try again later.';
                    console.error('Error fetching the joke:', error);
                });
        });
    </script>
</body>
</html>