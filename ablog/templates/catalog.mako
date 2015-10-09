<%inherit file="layout.mako"/>
% for collection in catalog:
  % if collection:
  <div class="section">
    <h2>
      ${ header }
      <a href="${ pathto(collection.docname) }">${ collection }</a>
    </h2>
    % for post in collection:
    <div class="section">
      <p>
      % if post.published:
        ${ post.date.strftime(_(ablog.post_date_format)) }
      % else:
        Draft
      % endif
      - <a href="${ pathto(post.docname) }${ anchor(post) }">${ post.title }</a>
      </p>
    </div>
    % endfor
  </div>
  % endif
% endfor
