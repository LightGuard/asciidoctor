# Public: Template for outputting a dzslides presentation
#
# TODO: I don't know if a patch of the base class is needed or not
class Asciidoctor::BaseTemplate

end

module Asciidoctor::DZSLIDES
  class Document < ::Asciidoctor::BaseTemplate
    BUILTIN_ATTRIBUTES = {
      'basebackend'      => 'html5',                                'basebackend-html5'   => '', 
      'backend-dzslides' => '',                                     'dzslides-aspect'     => '4-3', 
      'dszlides-style'   => 'default',                              'dzslides-transition' => 'horizontal-slide', 
      'dzslides-fonts'   => 'family=Oswald',                        'topic'               => 'role=topic', 
      'intro'            => 'role="topic intro"',                   'source'              => 'role="topic source"', 
      'recap'            => 'role="topic recap"',                   'recap-final'         => 'role="topic recap final"', 
      'ending'           => 'role="topic ending"',                  'statement'           => 'role="statement"', 
      'middle'           => 'role="middle"',                        'stepwise'            => 'role="incremental"', 
      'stepwise-alt'     => 'role="incremental middle pull-right"', 'followup'            => 'role="followup"', 
      'macros-on'        => 'subs="macros"'
    }
  end

	class BlockExampleTemplate < ::Asciidoctor::BaseTemplate
		def template
			# TODO: No idea how to port this one
			@template
		end
	end 

	class BlockListingTemplate < ::Asciidoctor::BaseTemplate
		def template
			@template ||= @eruby.new <<-EOS
<%#encoding:UTF-8%>
<div#{id} class="listing">
	<% if title? %>
	<div class="title"><%= title %></div>
	<% end %>
	<div class="content monospaced">
    <% if (attr :style) == 'source' %>
    <pre class="highlight<% if attr('source-highlighter') == 'coderay' %> CodeRay<% end %>"><code#{attribute('class', :language)}><%= template.preserve_endlines(content, self) %></code></pre>
    <% else %>
    <pre><%= template.preserve_endlines(content, self) %></pre>
    <% end %>
  </div>
</div>
EOS
		end
	end
end
