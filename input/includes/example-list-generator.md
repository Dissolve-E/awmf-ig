{% assign types_string = "" %}

{% for p in site.data.ig.definition.resource %}
  {% if p.isExample %}
    {% assign ref_type = p.reference.reference | split:'/' | first %}
    {% if types_string == "" %}
      {% assign types_string = ref_type %}
    {% else %}
      {% assign types_string = types_string | append: "," | append: ref_type %}
    {% endif %}
  {% endif %}
{% endfor %}

{% assign my_array = types_string | split: "," | sort | uniq %}

{% for i in my_array %}
### {{ i }}
  {%- for p in site.data.ig.definition.resource -%}
      {%- if p.isExample -%}
        {%- assign type =  p.reference.reference | split: '/' | first -%}
            {%- if type == i %}
- [{{p.name}}]({{p.reference.reference | replace: '/','-'}}.html)
            {%- endif -%}
       {%- endif -%}
   {%- endfor %}
{% comment %} keep this line here for proper rendering {% endcomment %}
{% endfor %}
