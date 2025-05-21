{% assign reference_found = false %}

{%- comment -%}
  Normalise the supplied name:
  take whatever comes after the first “:”, then trim spaces.
  Example → “CS:My CodeSystem” ➜ “My CodeSystem”.
{%- endcomment -%}
{% assign search_name = include.name | split: ':' | last | strip %}

{%- for p in site.data.ig.definition.resource -%}
  {% assign type = p.reference.reference | split: '/' | first %}
  {%- if p.exampleBoolean or p.exampleCanonical or type != 'CodeSystem' -%}
    {%- continue -%}
  {%- endif -%}

  {%- if p.name == search_name -%}
    {% assign reference_found = true %}
    {% assign link = p.reference.reference | replace: '/','-' | append: '.html' %}
    {% include resource-explicit.md
         name=p.name
         link=link
         description=p.description %}
  {%- endif -%}
{%- endfor -%}
{% comment %} keep this line here for proper rendering {% endcomment %}

{% unless reference_found %}
**ERROR**: Could not find reference for “{{ include.name }}”
{:.stu-note}
{% endunless %}
