# require "csv"


# Builds the XML of a given contact data.
# Example:
# build_contact("Arc", "l3g@shoe.com", "123-456-7890", "12345")
def build_contact(contact_name : String, contact_email : String, contact_phone : String, contact_zip : String)
  string = "BEGIN:VCARD
  VERSION:2.1
  FN:#{contact_name}
  EMAIL;X-INTERNET:#{contact_email}
  TEL;CELL:#{contact_phone}
  END:VCARD
  "
  string
end

vcard_gen = build_contact("Arc", "l3g@shoe.com", "123-456-7890", "12345")

puts vcard_gen

# Writes the XML to a file.
File.write "contacts.vcf", vcard_gen
