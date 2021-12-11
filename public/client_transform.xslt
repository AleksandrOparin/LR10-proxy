<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">

    <html>
      <head>
        <title>Ответ</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>
      </head>

      <body>
        <section class="py-5 text-center container fst-italic"> 
          <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
              <h1 class="fw-bold"> Ответ </h1>
              <div class="col-12">

                <xsl:choose>
                  <xsl:when test="hash/message">
                    <p class="text-danger m-3 fs-4"><xsl:value-of select="hash/message"/></p>
                  </xsl:when>

                  <xsl:otherwise>
                    <table class="table text-center fs-4">
                      <thead>
                        <tr>
                          <th> № </th>
                          <th> Число </th>
                          <th> Квадрат числа </th>
                        </tr>
                      </thead>

                      <tbody>
                        <xsl:for-each select="objects/object">
                          <xsl:variable name="counter" select="position()"/>
                          <tr>
                            <th class="fw-normal">
                              <xsl:value-of select="$counter"></xsl:value-of>
                            </th>
                            <th class="fw-normal">
                              <xsl:value-of select="elem"></xsl:value-of>
                            </th>
                            <th class="fw-normal">
                              <xsl:value-of select="square"></xsl:value-of>
                            </th>
                            </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </xsl:otherwise>
                </xsl:choose>

              </div>
            </div>
          </div>
        </section>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>