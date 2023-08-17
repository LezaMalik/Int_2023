# This python code generates an email to the sender with :
# Subject, Message, File attachment, Attachement header
# Sender and receiver's mail should be mentioned with sender's password.
# Password is generated with the help of App Manager from gmail settings.
# With this code, we can send any file to the sender.
# hardcoded email & password just to check - not recommended. 
# Usage: python3 mail.py 

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication

# Email configuration
sender_email = '' #write sender mail
receiver_email = '' #write receiver mail
subject = 'Test Email with Attachment (file data)'
message = 'This is a Test Email only to check if the attachemnet is attached properly.'

# Create the MIME object
msg = MIMEMultipart()
msg['From'] = sender_email
msg['To'] = receiver_email
msg['Subject'] = subject
msg.attach(MIMEText(message, 'plain'))

# Attach the file
attachment_path = '/home/leza/Documents/repos/scripts/xyz.csv' 
attachment = open(attachment_path, "rb").read()
attachment_mime = MIMEApplication(attachment, _subtype="csv") 
attachment_mime.add_header('content-disposition', 'attachment', filename='filterByExtCheck.csv')
msg.attach(attachment_mime)

# Connect to the SMTP server
smtp_server = smtplib.SMTP('smtp.gmail.com', 587)
smtp_server.starttls()
smtp_server.login(sender_email, 'mypassword') # write your password

# Send the email
smtp_server.sendmail(sender_email, receiver_email, msg.as_string())

# Close the connection
smtp_server.quit()

print("Email sent successfully.")
