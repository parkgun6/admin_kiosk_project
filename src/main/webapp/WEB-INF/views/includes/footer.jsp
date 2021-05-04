</div>
<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- footer -->
<!-- ============================================================== -->
<footer class="footer text-center">
    All Rights Reserved by Matrix-admin. Designed and Developed by <a
        href="https://www.wrappixel.com">WrapPixel</a>.
</footer>
<!-- ============================================================== -->
<!-- End footer -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="/owner/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="/owner/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/owner/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="/owner/resources/assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="/owner/resources/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="/owner/resources/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="/owner/resources/dist/js/custom.min.js"></script>
<!--This page JavaScript -->
<!-- <script src="<c:url value="/resources/dist/js/pages/dashboards/dashboard1.js"/>"></script> -->
<!-- Charts js Files -->
<script src="/owner/resources/assets/libs/flot/excanvas.js"></script>
<script src="/owner/resources/assets/libs/flot/jquery.flot.js"></script>
<script src="/owner/resources/assets/libs/flot/jquery.flot.pie.js"></script>
<script src="/owner/resources/assets/libs/flot/jquery.flot.time.js"></script>
<script src="/owner/resources/assets/libs/flot/jquery.flot.stack.js"></script>
<script src="/owner/resources/assets/libs/flot/jquery.flot.crosshair.js"></script>
<script src="/owner/resources/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="/owner/resources/dist/js/pages/chart/chart-page-init.js"></script>
<!-- table js -->
<script src="/owner/resources/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="/owner/resources/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="/owner/resources/assets/extra-libs/DataTables/datatables.min.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

<script src="/owner/resources/assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<script src="/owner/resources/dist/js/pages/mask/mask.init.js"></script>
<script src="/owner/resources/assets/libs/select2/dist/js/select2.full.min.js"></script>
<script src="/owner/resources/assets/libs/select2/dist/js/select2.min.js"></script>
<script src="/owner/resources/assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
<script src="/owner/resources/assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
<script src="/owner/resources/assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
<script src="/owner/resources/assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
<script src="/owner/resources/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>


<script>

/* -----------------------------------에디터 툴바 옵션------------------------------------- */
	var toolbarOptions = [ [ {
		'size' : [ 'small', false, 'large', 'huge' ]
	} ], // custom dropdown
	[ {
		'header' : [ 1, 2, 3, 4, 5, 6, false ]
	} ], [ 'bold', 'italic', 'underline', 'strike' ],
			[ 'link', 'image', 'video' ], // toggled buttons
			[ 'blockquote', 'code-block' ],

			[ {
				'header' : 1
			}, {
				'header' : 2
			} ], // custom button values
			[ {
				'list' : 'ordered'
			}, {
				'list' : 'bullet'
			} ], [ {
				'script' : 'sub'
			}, {
				'script' : 'super'
			} ], // superscript/subscript
			[ {
				'indent' : '-1'
			}, {
				'indent' : '+1'
			} ], // outdent/indent
			[ {
				'direction' : 'rtl'
			} ], // text direction

			[ {
				'color' : []
			}, {
				'background' : []
			} ], // dropdown with defaults from theme
			[ {
				'font' : []
			} ], [ {
				'align' : []
			} ],

			[ 'clean' ] // remove formatting button
	];

	var quill = new Quill('#editor', {
		modules : {
			toolbar : toolbarOptions
		},
		theme : 'snow'
	});
    //***********************************//
    // For select 2
    //***********************************//
    $(".select2").select2();

    /*colorpicker*/
    $('.demo').each(function () {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
            control: $(this).attr('data-control') || 'hue',
            position: $(this).attr('data-position') || 'bottom left',

            change: function (value, opacity) {
                if (!value) return;
                if (opacity) value += ', ' + opacity;
                if (typeof console === 'object') {
                    console.log(value);
                }
            },
            theme: 'bootstrap'
        });

    });

</script>
</body>

</html>