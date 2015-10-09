<% fa = ablog.fontawesome %>
<%inherit file="layout.mako"/>
  <div class="section">

    <h1>
% if archive_feed and fa:
      <a href="${ pathto(collection.path, 1) }/atom.xml"><i class="fa fa-rss fa-rotate-270"></i></a>
% endif
      ${ header }
% if collection.href:
      <a href="${ collection.href }">${ collection }</a>
% else:
      ${ collection }
% endif
    </h1>
% if ablog.blog_archive_titles:
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
% else:
  % for post in collection:

    <div class="section">
      <h2><a href="${ pathto(post.docname) }${ anchor(post) }">${ post.title }</a></h2>

      <ul class="ablog-archive">
      <li>
    % if post.published:
      % if fa:
    <i class="fa fa-calendar"></i>
      % endif
        ${ post.date.strftime(_(ablog.post_date_format)) }
    % else:
      % if fa:
      <i class="fa fa-pencil"></i>
      % endif
      % if post.date:
      ${ post.date.strftime(_(ablog.post_date_format)) }
      % else:
      Draft
      % endif:
    % endif
      </li>
      <%include file="postcard2.mako"/></ul>
      ${ post.to_html(collection.docname) }
      <p><a href="${ pathto(post.docname) }">${ _("Read more ...") }</a></p>
      <hr>
    </div>
  % endfor
% endif
  </div>
