let items = [];

function appendValue(calories, label) {
    let idx = items.findIndex(item => item.label === label);
    if (idx > -1) {
        items[idx].quantity += 1;
    } else {
        items.push({
            label: label,
            calories: calories,
            grams: 100,
            quantity: 1,
            image: getImagePath(label)
        });
    }
    renderTable();
}

function clearDisplay() {
    items = [];
    renderTable();
}

function increaseQuantity(index) {
    items[index].quantity += 1;
    renderTable();
}

function decreaseQuantity(index) {
    if (items[index].quantity > 1) {
        items[index].quantity -= 1;
    } else {
        items.splice(index, 1);
    }
    renderTable();
}

function updateGrams(index, newGrams) {
    items[index].grams = parseInt(newGrams) || 100;
    renderTable();
}

function filterItems() {
    const search = document.getElementById('searchBar').value.toLowerCase();
    const buttons = document.querySelectorAll('#buttonsContainer button');
    buttons.forEach(btn => {
        const text = btn.textContent.toLowerCase();
        const alt = btn.querySelector('img') ? btn.querySelector('img').alt.toLowerCase() : '';
        btn.style.display = (text.includes(search) || alt.includes(search)) ? '' : 'none';
    });
}

function renderTable() {
    const tbody = document.getElementById('tableBody');
    tbody.innerHTML = '';
    let total = 0;
    items.forEach((item, idx) => {
        const cal = ((item.calories / 100) * item.grams) * item.quantity;
        total += cal;
        const row = document.createElement('tr');
        row.innerHTML = `
            <td><img src="${item.image}" alt="${item.label}" style="width:40px;height:40px;border-radius:8px;"></td>
            <td>${item.label}</td>
            <td>
                <input type="number" min="1" value="${item.grams}" style="width:60px;" onchange="updateGrams(${idx}, this.value)">
            </td>
            <td>${item.quantity}</td>
            <td>${cal.toFixed(1)}</td>
            <td><button onclick="decreaseQuantity(${idx})" style="background:#f5a623;color:#fff;border:none;border-radius:6px;padding:6px 12px;">-</button></td>
            <td><button onclick="increaseQuantity(${idx})" style="background:#28a745;color:#fff;border:none;border-radius:6px;padding:6px 12px;">+</button></td>
        `;
        tbody.appendChild(row);
    });
    document.getElementById('totalCalories').textContent = 'Total Calories: ' + total.toFixed(1);
}

function getImagePath(label) {
    const images = {
        'Apple': 'Food images/Apple Image.png',
        'Banana': 'Food images/Banana Image.png',
        'Burger': 'Food images/Burger Image.png',
        'Pizza': 'Food images/Pizza Slice Image.png',
        'Salad': 'Food images/Salad Bowl Image.png',
        'Sandwich': 'Food images/Sandwich Image.png',
        'Orange': 'Food images/Orange Image.png',
        'Egg': 'Food images/Egg Image.png',
        'Milk': 'Food images/Milk Carton Image.png',
        'FrenchFries': 'Food images/French Fries Image.png',
        'Chicken': 'Food images/Cooked Chicken Image.png',
        'Beef': 'Food images/Cooked Beef Image.png',
        'IceCream': 'Food images/Ice Cream Scoop Image.png',
        'Tofu': 'Food images/Tofu Block Image.png',
        'Pasta': 'Food images/Pasta Dish Image.png',
        'Cheese': 'Food images/Cheese Block Image.png',
        'Rice': 'Food images/Cooked Rice Image.png',
        'Bread': 'Food images/Bread Loaf Image.png',
        'Papaya': 'Food images/Papaya Slice Image.png',
        'Mushroom': 'Food images/Mushroom Image.png',
        'Avocado': 'Food images/Avocado Half Image.png',
        'Yogurt': 'Food images/Yogurt Cup Image.png',
        'Salmon': 'Food images/Salmon Fillet Image.png'
    };
    return images[label] || '';
}

// Expose functions to global scope for inline HTML event handlers
window.appendValue = appendValue;
window.clearDisplay = clearDisplay;
window.increaseQuantity = increaseQuantity;
window.decreaseQuantity = decreaseQuantity;
window.updateGrams = updateGrams;
window.filterItems = filterItems;

// Initial render and focus
window.onload = function() {
    if (document.getElementById('searchBar')) {
        document.getElementById('searchBar').focus();
    }
    renderTable();
};