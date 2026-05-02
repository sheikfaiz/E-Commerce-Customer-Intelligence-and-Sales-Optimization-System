import pandas as pd
from mlxtend.frequent_patterns import apriori, association_rules

# Load dataset
data = pd.read_csv("data\\basket_data.csv")

# Create basket matrix
basket = (
    data.groupby(['invoice_no', 'description'])['quantity']
    .sum()
    .unstack()
    .fillna(0)
)

# Convert quantities to binary (0 or 1)
basket = basket.applymap(lambda x: 1 if x > 0 else 0)

# Run Apriori algorithm
frequent_items = apriori(basket, min_support=0.02, use_colnames=True)

# Generate association rules
rules = association_rules(frequent_items, metric="lift", min_threshold=1)

# Sort rules
rules = rules.sort_values("lift", ascending=False)

print(rules.head(10))

# Save results
rules.to_csv("output/market_basket_rules.csv", index=False)