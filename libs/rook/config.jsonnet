local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '1.12.4', version: 'v1.12.4' },
];

config.new(
  name='rook',
  specs=[
    {
      prefix: '^ceph\\.rook\\.io\\..*',
      output: v.output,
      crds: [
        'https://raw.githubusercontent.com/rook/rook/%s/deploy/examples/crds.yaml' % v.version,
      ],
      localName: 'rook',
    }
    for v in versions
  ]
)
