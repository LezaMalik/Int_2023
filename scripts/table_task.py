# This program takes a filename with the flag -t (no.) for tot number of columns in the file specified 
# The flag -c(number of column)=(headnername) column nos to display with their headers from the user.
# Example: table_task.py filename.csv -t 10 -c1=name -c3=contact -c7=address -c10=gender
# Here the program will first check if the file exists and have the specidied number of columns
# Then is checks for the columns and append their headers on top 
# Displays the first, third, seventh and tenth column from the csv file.
# Returns the output in well formatted tabular form with proper padding. 


# Allows to access command-line arguments and exit function
import sys

# Define a function to read the content of a file
def read_file(filename):
    try:
        with open(filename, 'r') as file:
            lines = file.readlines()  # Read all lines of the file
        return lines
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found.")  # Print an error message if the file doesn't exist
        sys.exit(1)  # Exit the script with an error code

# Define a function to parse command-line flags and arguments
def parse_flags(args, num_columns):
    flags = {
        '-t': False,  # Initialize the '-t' flag as False
    }
    custom_columns = {}  # Dictionary to store custom column numbers and headers
    
    i = 0
    while i < len(args):
        arg = args[i]
        if arg == '-t':
            flags[arg] = True  # Set the '-t' flag to True
            i += 1
        elif arg.startswith('-c'):
            parts = arg.split('=')
            if len(parts) == 2:
                column_num = int(parts[0][2:])  # Extract the column number from the flag
                header_val = parts[1]  # Extract the header value from the flag
                if 1 <= column_num <= num_columns:  # Check if column number is within valid range
                    custom_columns[column_num] = header_val
                else:
                    print(f"Error: Invalid flag value")
                    sys.exit(1)
                i += 1
            else:
                print(f"Error: Invalid flag '{arg}'.")
                sys.exit(1)
        else:
            print(f"Error: Invalid flag '{arg}'.")
            sys.exit(1)
    
    return flags, custom_columns  # Return the parsed flags and custom columns

# Define the main function of the script
def main():
    if len(sys.argv) < 4:
        print("Usage: python3 table_task.py filename -t num_columns -c1 header1 -c2 header2 ...")
        sys.exit(1)  # Exit if insufficient arguments are provided
    
    filename = sys.argv[1]  # Get the filename from command-line argument
    
    # Find the index of '-t' flag in command-line arguments
    t_flag_index = sys.argv.index('-t')
    num_columns = int(sys.argv[t_flag_index + 1])  # Get the number of columns after '-t' flag
    flags, custom_columns = parse_flags(sys.argv[t_flag_index + 2:], num_columns)  # Parse flags after num_columns
    
    lines = read_file(filename)  # Read the content of the file
    headers = lines[0].strip().split(',')  # Extract headers from the first line
    
    if not 1 <= num_columns <= len(headers):
        print(f"Error: Invalid input flag value.")
        sys.exit(1)  # Exit if the -t value is not within the valid range
    
    if flags['-t']:
        if num_columns != len(headers):
            print(f"Error: Number of columns provided does not match the actual number of columns in the file.")
            sys.exit(1)  # Exit if the number of columns doesn't match
    
    
    # Calculate column widths for formatting
    col_widths = []
    for col_num, header in custom_columns.items():
        max_word_count = max(len(values[col_num - 1].split()) for values in lines[1:])
        col_widths.append(max(max_word_count + 10, len(header) + 10))

        # /home/leza/Documents/repos/scripts/leza.sh 
    
    # Print header separator line
    header_line = "="
    for col_width in col_widths:
        header_line += "=" * (col_width + 2) + "="
    print(header_line)

    # Print custom column headers
    header_line = "|"
    for header, col_width in zip(custom_columns.values(), col_widths):
        padding = (col_width - len(header)) // 2
        header_line += " {}{}{} |".format(" " * padding, header, " " * (col_width - len(header) - padding))
    print(header_line)

    # Print header separator line again
    header_line = "="
    for col_width in col_widths:
        header_line += "=" * (col_width + 2) + "="
    print(header_line)

    
    # Print rows of data
    for line in lines[0:]:
        values = line.strip().split(',')
        row = "|"
        for col_num, col_width in zip(custom_columns.keys(), col_widths):
            if col_num <= len(values):
                value = values[col_num - 1]
            else:
                value = ""
            padding = (col_width - len(value)) // 2
            row += " {}{}{} |".format(" " * padding, value, " " * (col_width - len(value) - padding))
        print(row)

    
    # Print footer separator line
    footer_line = "-"
    for col_width in col_widths:
        footer_line += "-" * (col_width + 2) + "-"
    print(footer_line)


# Execute the main function if the script is run as the main program
if __name__ == "__main__":
    main()
