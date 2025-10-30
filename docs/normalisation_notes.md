# Normalisation Notes

The Cars4U database design follows the first three normal forms.

**1NF:** Each attribute is atomic and contains only one value. For example, Customer phone numbers are stored as single values per record, ensuring no repeating groups.

**2NF:** Every non-key attribute depends on the entire primary key. In the Rental table, fields such as StartDate and EndDate depend solely on RentalID, not partially on another field.

**3NF:** There are no transitive dependencies. Attributes that depend on other non-key fields (like pricing depending on car class) have been separated into related tables (CarClass, Promotion, DropoffCharge).

**Entity Integrity:** Every table has a unique primary key (e.g., CarID, RentalID).  
**Referential Integrity:** Foreign keys (e.g., CustomerID in Rental) reference existing primary keys in their related tables, ensuring consistency between data entities.

This structure minimises redundancy, avoids anomalies, and maintains logical consistency.
