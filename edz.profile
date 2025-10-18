<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Profile</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background: linear-gradient(135deg, #0f3d2e 60%, #1b5e20 100%);
      margin: 0;
      padding: 0;
      color: #d9f7df;
    }
    .profile-container {
      max-width: 400px;
      margin: 60px auto;
      background: #1a2f23;
      border-radius: 20px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.4);
      padding: 40px 30px;
      text-align: center;
    }
    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 4px solid #66bb6a;
      margin-bottom: 20px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    }
    .profile-name {
      font-size: 2em;
      font-weight: bold;
      color: #81c784;
      margin-bottom: 10px;
    }
    .profile-info {
      font-size: 1.1em;
      margin-bottom: 18px;
      color: #a5d6a7;
    }
    .profile-details {
      background: #254032;
      border-radius: 12px;
      padding: 18px;
      margin-bottom: 10px;
      text-align: left;
      font-size: 1em;
      color: #e8fdf1;
    }
    .profile-details strong {
      color: #66bb6a;
    }
    .back-link {
      display: inline-block;
      margin-top: 20px;
      color: #81c784;
      text-decoration: none;
      font-weight: bold;
      transition: color 0.2s;
    }
    .back-link:hover {
      color: #66bb6a;
    }

    /* Section containers */
    .section-box {
      background: #254032;
      border-radius: 12px;
      padding: 18px;
      margin-bottom: 18px;
      text-align: left;
      color: #d9f7df;
    }
    h3 {
      color: #81c784;
      margin-top: 0;
    }
    select, input, button {
      font-family: inherit;
    }
    select {
      margin-bottom: 12px;
      padding: 6px 12px;
      border-radius: 6px;
      border: 1px solid #81c784;
      background: #1a2f23;
      color: #e8fdf1;
    }
    input#chatbot-input {
      flex: 1;
      padding: 8px;
      border-radius: 6px;
      border: 1px solid #81c784;
      background: #1a2f23;
      color: #e8fdf1;
    }
    input#chatbot-input::placeholder {
      color: #a5d6a7;
    }
    button {
      margin-left: 8px;
      background: #43a047;
      color: #fff;
      border: none;
      border-radius: 6px;
      padding: 8px 16px;
      cursor: pointer;
      transition: background 0.2s;
    }
    button:hover {
      background: #2e7d32;
    }

    /* Floating Chatbot Styles */
    #chatbot-float {
      position: fixed;
      bottom: 32px;
      right: 32px;
      z-index: 9999;
      background: #388e3c;
      width: 60px;
      height: 60px;
      border-radius: 50%;
      box-shadow: 0 4px 16px rgba(0,0,0,0.3);
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: box-shadow 0.2s;
    }
    #chatbot-popup {
      position: fixed;
      bottom: 100px;
      right: 32px;
      z-index: 10000;
      width: 320px;
      background: #254032;
      border-radius: 16px;
      box-shadow: 0 8px 32px rgba(0,0,0,0.4);
      padding: 18px;
      display: none;
    }
  </style>
</head>
<body>
  <div class="profile-container">
    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User Avatar" class="profile-avatar">
    <div class="profile-name">John Doe</div>
    <div class="profile-info">Goal: <strong>Lose Weight</strong></div>

    <div class="profile-details">
      <div><strong>Age:</strong> 28</div>
      <div><strong>Height:</strong> 175 cm</div>
      <div><strong>Weight:</strong> 72 kg</div>
      <div><strong>BMI:</strong> <span id="bmi-value"></span></div>
    </div>

    <!-- Meal Plan Section -->
    <div class="section-box">
      <h3>Today's Meal Plan</h3>
      <select id="daySelector">
        <option value="0">Sunday</option>
        <option value="1">Monday</option>
        <option value="2">Tuesday</option>
        <option value="3">Wednesday</option>
        <option value="4">Thursday</option>
        <option value="5">Friday</option>
        <option value="6">Saturday</option>
      </select>
      <div id="meal-plan"></div>
    </div>

    <!-- Progress Tracker -->
    <div class="section-box">
      <h3>Progress Tracker</h3>
      <div id="calendar"></div>
      <div id="progress-info" style="margin-top:12px; color:#81c784;"></div>
    </div>

    <!-- AI Chatbot Section -->
    <div class="section-box">
      <h3>AI Chatbot</h3>
      <div id="chatbot-window" style="height:180px; overflow-y:auto; background:#1a2f23; border-radius:8px; border:1px solid #3c5c46; padding:10px; margin-bottom:10px; font-size:0.98em; color:#e8fdf1;"></div>
      <div style="display:flex;">
        <input id="chatbot-input" type="text" placeholder="Ask me about your meal plan, calories, BMI...">
        <button onclick="sendChatbotMessage()">Send</button>
      </div>
    </div>

    <a href="calcu.html" class="back-link">&larr; Back to Calculator</a>
  </div>

  <!-- Floating Chatbot Icon -->
  <div id="chatbot-float">
    <span style="font-size:2em; color:#fff;">💬</span>
  </div>

  <!-- Chatbot Popup -->
  <div id="chatbot-popup">
    <h3>AI Chatbot</h3>
    <div id="chatbot-window-popup" style="height:140px; overflow-y:auto; background:#1a2f23; border-radius:8px; border:1px solid #3c5c46; padding:10px; margin-bottom:10px; font-size:0.98em; color:#e8fdf1;"></div>
    <div style="display:flex;">
      <input id="chatbot-input-popup" type="text" placeholder="Ask me about your meal plan, calories, BMI...">
      <button onclick="sendPopupChat()">Send</button>
    </div>
  </div>

  <script>
    // --- BMI ---
    const heightCm = 175;
    const weightKg = 72;
    const bmi = (weightKg / ((heightCm / 100) ** 2)).toFixed(1);
    document.getElementById('bmi-value').textContent = bmi;

    // --- Progress Tracker ---
    function renderCalendar() {
      const today = new Date();
      const days = [];
      for (let i = 0; i < 7; i++) {
        const d = new Date(today);
        d.setDate(today.getDate() - today.getDay() + i);
        days.push(d);
      }
      let html = '<table style="width:100%; text-align:center;"><tr>';
      days.forEach(day => {
        html += `<th style="padding:6px; color:#81c784;">${day.toLocaleDateString(undefined, {weekday:'short'})}</th>`;
      });
      html += '</tr><tr>';
      days.forEach(day => {
        html += `<td><input type="checkbox" id="day${day.getDay()}" /></td>`;
      });
      html += '</tr></table>';
      document.getElementById('calendar').innerHTML = html;
    }

    function updateProgress() {
      let checked = 0;
      for (let i = 0; i < 7; i++) {
        if (document.getElementById('day' + i).checked) checked++;
      }
      document.getElementById('progress-info').textContent = `You followed your meal plan ${checked} out of 7 days this week!`;
    }

    renderCalendar();
    for (let i = 0; i < 7; i++) {
      document.getElementById('day' + i).addEventListener('change', updateProgress);
    }

    // --- Meal Plan ---
    const weeklyMealPlans = [
      { breakfast: "Oatmeal with Banana (200 kcal)", lunch: "Grilled Chicken Salad (350 kcal)", dinner: "Salmon, Rice & Veggies (400 kcal)", total: 950 },
      { breakfast: "Greek Yogurt & Berries (220 kcal)", lunch: "Turkey Sandwich (370 kcal)", dinner: "Stir-fried Tofu & Vegetables (410 kcal)", total: 1000 },
      { breakfast: "Scrambled Eggs & Toast (250 kcal)", lunch: "Quinoa Salad (340 kcal)", dinner: "Baked Cod & Sweet Potato (420 kcal)", total: 1010 },
      { breakfast: "Fruit Smoothie (180 kcal)", lunch: "Chicken Wrap (360 kcal)", dinner: "Vegetable Pasta (430 kcal)", total: 970 },
      { breakfast: "Peanut Butter Toast (210 kcal)", lunch: "Lentil Soup & Bread (350 kcal)", dinner: "Grilled Shrimp & Rice (400 kcal)", total: 960 },
      { breakfast: "Omelette & Tomato (230 kcal)", lunch: "Tuna Salad (360 kcal)", dinner: "Chicken Curry & Rice (420 kcal)", total: 1010 },
      { breakfast: "Cottage Cheese & Pineapple (200 kcal)", lunch: "Veggie Burger (370 kcal)", dinner: "Beef Stew & Potato (420 kcal)", total: 990 }
    ];

    function showMealPlanForDay(dayIndex) {
      const plan = weeklyMealPlans[dayIndex];
      document.getElementById('meal-plan').innerHTML = `
        <b>Breakfast:</b> ${plan.breakfast}<br>
        <b>Lunch:</b> ${plan.lunch}<br>
        <b>Dinner:</b> ${plan.dinner}<br>
        <i>Total: ~${plan.total} kcal</i>
      `;
    }

    const todayIndex = new Date().getDay();
    document.getElementById('daySelector').selectedIndex = todayIndex;
    showMealPlanForDay(todayIndex);

    document.getElementById('daySelector').addEventListener('change', function() {
      showMealPlanForDay(this.value);
    });

    // --- Floating Chatbot ---
    const chatbotFloat = document.getElementById('chatbot-float');
    const chatbotPopup = document.getElementById('chatbot-popup');
    chatbotFloat.onclick = function() {
      chatbotPopup.style.display = chatbotPopup.style.display === 'none' ? 'block' : 'none';
    };
    document.addEventListener('click', function(e) {
      if (chatbotPopup.style.display === 'block' && !chatbotPopup.contains(e.target) && !chatbotFloat.contains(e.target)) {
        chatbotPopup.style.display = 'none';
      }
    });

    // --- AI Chatbot ---
    function sendChatbotMessage() {
      const input = document.getElementById('chatbot-input');
      const windowEl = document.getElementById('chatbot-window');
      const msg = input.value.trim();
      if (!msg) return;
      windowEl.innerHTML += `<div><b>You:</b> ${msg}</div>`;
      input.value = '';
      let response = "I'm here to help! Ask me about your meal plan, calories, or BMI.";
      if (/bmi/i.test(msg)) response = `Your BMI is <b>${bmi}</b>.`;
      else if (/calorie/i.test(msg)) response = "Your daily meal plan ranges from <b>950</b>–<b>1010</b> kcal.";
      else if (/hello|hi|hey/i.test(msg)) response = "Hello! How can I assist you today?";
      windowEl.innerHTML += `<div style="color:#81c784;"><b>AI:</b> ${response}</div>`;
      windowEl.scrollTop = windowEl.scrollHeight;
    }

    function sendPopupChat() {
      const input = document.getElementById('chatbot-input-popup');
      const windowEl = document.getElementById('chatbot-window-popup');
      const msg = input.value.trim();
      if (!msg) return;
      windowEl.innerHTML += `<div><b>You:</b> ${msg}</div>`;
      input.value = '';
      let response = "I'm here to help! Ask me about your meal plan, calories, or BMI.";
      if (/bmi/i.test(msg)) response = `Your BMI is <b>${bmi}</b>.`;
      else if (/calorie/i.test(msg)) response = "Your daily meal plan ranges from <b>950</b>–<b>1010</b> kcal.";
      else if (/hello|hi|hey/i.test(msg)) response = "Hello! How can I assist you today?";
      windowEl.innerHTML += `<div style="color:#81c784;"><b>AI:</b> ${response}</div>`;
      windowEl.scrollTop = windowEl.scrollHeight;
    }
  </script>
</body>
</html>
