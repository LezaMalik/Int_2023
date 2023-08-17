import smtplib
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication

def main():
    receiver_email = input("Enter recipient's email address: ")
    subject = input("Enter the subject: ")
    csv_file_path = input("Enter the path of the CSV file: ")

    sender_email = ''

    # Read the contents of the CSV file for the email body
    with open(csv_file_path, 'r') as csv_file:
        email_body = csv_file.read()

    msg = MIMEMultipart()
    msg['From'] = sender_email
    msg['To'] = receiver_email
    msg['Subject'] = subject

    # Attach email body as plain text
    msg.attach(MIMEText(email_body, 'plain'))

    smtp_server = smtplib.SMTP('smtp.gmail.com', 587)
    smtp_server.starttls()
    smtp_server.login(sender_email, 'enteryourpassword')

    attachment_file_paths = []

    with open(csv_file_path, 'r') as csv_file:
        for line in csv_file:
            fields = line.strip().split(',')
            if len(fields) >= 6:
                attachment_file_paths.append(fields[3])  # Assuming paths are in the 4th column

    for file_path in attachment_file_paths:
        if os.path.exists(file_path):
            with open(file_path, 'rb') as file:
                attachment = file.read()
                attachment_mime = MIMEApplication(attachment)
                attachment_mime.add_header('content-disposition', 'attachment', filename=os.path.basename(file_path))
                msg.attach(attachment_mime)
        else:
            print(f"File not found: {file_path}")

    smtp_server.sendmail(sender_email, receiver_email, msg.as_string())

    smtp_server.quit()

    print("Email sent successfully.")

if __name__ == "__main__":
    main()
