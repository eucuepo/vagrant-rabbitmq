  class{"erlang":
    epel_enable => true
  }

  class{"rabbitmq":
    version                  => "3.2.3",
    admin_enable             => true,
    erlang_cookie            => "KII",
    wipe_db_on_cookie_change => true,
    config_cluster           => true,
    config_mirrored_queues   => true,
    cluster_nodes            => ['rabbitmq1', 'rabbitmq2', 'rabbitmq3'],
    cluster_node_type        => 'ram',
  }

  Class['erlang'] -> Class['rabbitmq']
