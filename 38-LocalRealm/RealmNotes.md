# Realm Notes

Create a notes App using realm.

You will need to create two model objects:

User
username: String
password: String
createdAt: NSDate
updatedAt: NSDate

---

Note
description: String
user: User?
createdAt: NSDate
updatedAt: NSDate

---

The App should have the ability to:

1. Register OR Edit an existing User
2. Login a User
3. Show a list of notes for a User
4. Add a note for a user
5. Search for another Users notes.
6. Show a Report of All users searchable by Date (UITableView) is fine.

Remember: Create More than one user with different dates to get user report (seed)


 




