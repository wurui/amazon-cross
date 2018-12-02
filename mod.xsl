<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.amazon-cross">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-amazon-cross" ox-mod="amazon-cross">
        	<xsl:variable select="data/ui-sale/i" name="list"/>
        	<xsl:variable select="count($list)" name="count"/>
        	
        	<xsl:variable select="format-number($count div 2,'#') " name="total_layer"/>
        	


        	<ul class="player J_player">
	            <xsl:for-each select="$list">
	            	<xsl:variable select=" position() - 1 " name="index"/>
	            	<xsl:variable name="direction">
	            		<xsl:choose>
	            			<xsl:when test="$index &lt; $total_layer">1</xsl:when>
	            			<xsl:otherwise>-1</xsl:otherwise>
	            		</xsl:choose>
	            	</xsl:variable>
	            	<xsl:variable name="layer">
	            		<xsl:choose>
	            			<xsl:when test="$index &lt; $total_layer"><xsl:value-of select="$index"/></xsl:when>
	            			<xsl:otherwise><xsl:value-of select="$total_layer - $index mod $total_layer - 1"/></xsl:otherwise>
	            		</xsl:choose>
	            	</xsl:variable>
	            	
	            	
	            	<li style="-webkit-transform: translateX({(2 div ( 2+ $layer ) ) * $layer * $direction * 40 }%) scale({2 div ( 2+ $layer )});z-index:{$total_layer - $layer};">
	            		<xsl:if test="$layer = 0">
	            			<xsl:attribute name="class">selected</xsl:attribute>
	            		</xsl:if>
	            		<div class="text">
	            			<h4>
		            			<xsl:value-of select="title"/>
		            		</h4>
		            		<h3>
		            			<xsl:value-of select="slogan"/>
		            		</h3>
	            		</div>
	            		<a href="{href}">
		            		<img src="//a.oxm1.cc/img/blank.png" style="background-image:url({img})"/>
		            	</a>
	            	</li>
	            </xsl:for-each>
	        </ul>
        </div>
    </xsl:template>
</xsl:stylesheet>
