#!/bin/bash
# extract-crs-from-policies.sh

INPUT_FILE="rendered-core-config.yaml"
OUTPUT_DIR="extracted-crs"

mkdir -p "$OUTPUT_DIR"

# Use yq or a similar tool to extract object-templates
# This is a simplified approach - you may need to adjust based on your exact structure

python3 << 'EOF'
import yaml
import sys
import os

output_dir = "extracted-crs"
os.makedirs(output_dir, exist_ok=True)

with open("rendered-core-config.yaml", 'r') as f:
    docs = yaml.safe_load_all(f)
    
    counter = 0
    for doc in docs:
        if not doc:
            continue
            
        # Check if it's a Policy
        if doc.get('kind') == 'Policy':
            policy_name = doc.get('metadata', {}).get('name', f'policy-{counter}')
            
            # Extract object-templates from ConfigurationPolicy
            policy_templates = doc.get('spec', {}).get('policy-templates', [])
            
            for pt_idx, pt in enumerate(policy_templates):
                obj_def = pt.get('objectDefinition', {})
                
                if obj_def.get('kind') == 'ConfigurationPolicy':
                    obj_templates = obj_def.get('spec', {}).get('object-templates', [])
                    
                    for ot_idx, ot in enumerate(obj_templates):
                        obj_template = ot.get('objectDefinition', {})
                        
                        if obj_template:
                            filename = f"{output_dir}/{policy_name}-{pt_idx}-{ot_idx}.yaml"
                            with open(filename, 'w') as out:
                                yaml.dump(obj_template, out, default_flow_style=False)
                            print(f"Extracted: {filename}")
            counter += 1
        else:
            # Not a policy, write as-is
            filename = f"{output_dir}/non-policy-{counter}.yaml"
            with open(filename, 'w') as out:
                yaml.dump(doc, out, default_flow_style=False)
            counter += 1

print(f"\nExtracted CRs to {output_dir}/")
EOF
