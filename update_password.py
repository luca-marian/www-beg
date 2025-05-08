import random
import string
import hashlib
import csv

users = [
    "john_doe42",
    "sarah.smith",
    "tech_guru",
    "mountain_hiker",
    "coding_ninja",
    "book_lover99",
    "fitness_fan",
    "music_master",
    "pet_enthusiast",
    "travel_addict",
    "coffee_lover",
    "gaming_pro",
    "photo_snapper",
    "food_explorer",
    "movie_buff",
    "nature_walker",
    "puzzle_solver",
    "science_geek",
    "art_creator",
    "history_buff",
    "space_explorer",
    "ocean_diver",
    "urban_designer",
    "yoga_master",
    "chess_player",
]


def generate_easy_password(length=12):
    chars = string.ascii_letters + string.digits + "!@#$%&*"
    password = [
        random.choice(string.ascii_lowercase),
        random.choice(string.ascii_uppercase),
        random.choice(string.digits),
        random.choice("!@#$%&*"),
    ]
    password += random.choices(chars, k=length - len(password))
    random.shuffle(password)
    return "".join(password)


# Generate and write to CSV
with open("new_user_passwords.csv", mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["username", "new_password", "hashed_password"])

    for user in users:
        new_password = generate_easy_password()
        hashed_password = hashlib.sha256(new_password.encode()).hexdigest()
        writer.writerow([user, new_password, hashed_password])

print("Passwords generated and saved to 'new_user_passwords.csv'.")
