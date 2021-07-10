require "csv"

# Builds the XML of a given contact data.
# Example:
# build_contact("Arc", "l3g@shoe.com", "123-456-7890", "12345")
def build_contact(contact_name : String, contact_email : String, contact_phone : String, contact_zip : String) : String
  string = "
BEGIN:VCARD
VERSION:2.1
N:;#{contact_name};
FN:#{contact_name}
EMAIL;X-INTERNET:#{contact_email}
TEL;CELL:#{contact_phone}
END:VCARD"
  string
end

# An empty string of the contact data.
contacts = ""

csv = CSV.new File.open("zephyr.csv"), headers: true
while csv.next
    contacts = contacts + build_contact csv["Name"], csv["Email Address"], csv["Phone #"], csv["Zip Code"]
end

puts contacts

File.write "contacts.vcf", contacts
